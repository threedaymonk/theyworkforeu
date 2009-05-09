module Europarl
  class Scraper
    DEBATES_URL = 'http://www.europarl.europa.eu/sides/getDoc.do?pubRef=-//EP//TEXT+CRE+%Y%m%d+ITEMS+DOC+XML+V0//EN&language=EN'
    def self.debates_url(date)
      date.strftime(DEBATES_URL)
    end

    def initialize(html, sitting)
      @html = html
      @sitting = sitting
    end

    def scrape
      @html.scan(%r{<p class="contents">.*?</p>|<td[^>]+class="doc_title".*?</td>|<img alt="MPphoto".*?>}m ) do |match|
        case match
        when /^<td/
          yield :title, strip(match)
        when /^<img/
          yield :image, match[/src="([^"]+)"/, 1]
        when /^<p/
          match.gsub!(%r{<span class="doc_subtitle_level1_bis">(.*?)</span>}m) do
            yield :member, strip($1)
          end
          yield :para, strip(match)
        end
      end
      nil
    end

    def each_contribution
      contribution = new_contribution
      image = nil
      scrape do |key, value|
        case key
        when :title
          yield contribution if contribution.original_text
          contribution = new_contribution
          contribution.original_text = value
          yield contribution
        when :image
          yield contribution if contribution.original_text
          contribution = new_contribution
          image = "http://www.europarl.europa.eu" + value
        when :member
          member = Member.find_by_photo(image)
          unless member
            member = Member.create!(:name => value, :photo => image)
          end
          contribution.member = member
        when :para
          contribution.original_text ||= ""
          contribution.original_text << value << "\n"
        end
      end
      yield contribution if contribution.original_text
    end

  private

    def new_contribution
      Contribution.new(:sitting => @sitting)
    end

    def strip(s)
      s.gsub(/<[^>]+>/m, '').gsub(/\s+/, ' ').strip
    end
  end
end
