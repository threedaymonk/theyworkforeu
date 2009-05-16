require 'hpricot'

module Europarl
  module Scraper
    class Debate
      class Section
        def initialize(node)
          @doc = node
        end

        def title
          title_with_number.sub(/^(?:\d+\.)+\s/, "")
        end

        def level
          title_with_number[/^(\d\.)+/].scan(/\d+\./).length - 1
        end

        def contributions
          @doc.search("table[@width='100%']")[1..-1].inject([]){ |array, node|
            unless node.at("p.contents[@align='center']")
              array << Debate::Contribution.new(node)
            end
            array
          }
        end

      private
        def title_with_number
          Scraper.normalize_whitespace(@doc.at("td.doc_title").inner_text)
        end
      end

      class Contribution
        def initialize(node)
          @doc = node
        end

        def ep_member_id
          url = @doc.at("img[@alt='MPphoto']").attributes["src"]
          if url =~ %r{/mepphoto/(\d+).jpg}
            $1.to_i
          else
            nil
          end
        end

        def name
          @doc.at("p.contents").at("span.doc_subtitle_level1_bis").inner_text.
            sub(/\s*\([^\)]+\)\s*/m, "").sub(/[\s,−\-\.]*$/, "")
        end

        def paragraphs
          @doc.search("p.contents").map{ |node|
            node = Hpricot(node.inner_html) # Deep clone to avoid clobbering name
            node.search("span.doc_subtitle_level1_bis").remove
            Scraper.normalize_whitespace(node.inner_html).
                    gsub(%r{<span class="italic">([^<]+)</span>}, "<em>\\1</em>")
          }
        end
      end

      DEBATES_URL = "http://www.europarl.europa.eu/sides/getDoc.do?pubRef="+
                    "-//EP//TEXT+CRE+%Y%m%d+ITEMS+DOC+XML+V0//EN&language=EN"

      def self.debates_url(date)
        date.strftime(DEBATES_URL)
      end

      def initialize(html)
        @doc = Hpricot(html)
      end

      def date
        Date.parse(@doc.at("title").inner_text.split(/-/).last.strip)
      end

      def sections
        # First table.doc_box_header is actually the table of contents
        @doc.search("table.doc_box_header")[1..-1].map{ |node| Debate::Section.new(node) }
      end
    end
  end
end
