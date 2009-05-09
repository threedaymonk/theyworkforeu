module Europarl
  class Scraper
    DEBATES_URL = 'http://www.europarl.europa.eu/sides/getDoc.do?pubRef=-//EP//TEXT+CRE+%Y%m%d+ITEMS+DOC+XML+V0//EN&language=EN'
    def self.debates_url(date)
      date.strftime(DEBATES_URL)
    end

    def initialize(html)
      @html = html
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

    def strip(s)
      s.gsub(/<[^>]+>/m, '').gsub(/\s+/, ' ').strip
    end
  end
end
