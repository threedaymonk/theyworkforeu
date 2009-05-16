require 'hpricot'

module Europarl
  module Scraper
    class Member
      MEMBER_URL = "http://www.europarl.europa.eu/members/public/geoSearch/view.do?language=EN&id=%d"

      def self.member_url(ep_member_id)
        MEMBER_URL % ep_member_id
      end

      def initialize(html)
        @doc = Hpricot(html)
      end

      def name
        Scraper.normalize_whitespace(@doc.at("td.mepname").inner_text)
      end

      def group
        Scraper.normalize_whitespace(@doc.at("span.titlemep").inner_text)
      end

      def country
        @doc.at("img[@src*='flag_']").attributes["src"][/flag_(..)/, 1]
      end

      def party
        cv["national party"]
      end

      def date_of_birth
        Date.parse(cv["birth date, birth place"][/\d+ \S+ \d{4}/])
      end

    private

      def cv
        @doc.at("td.mep_CVtext").inner_html.split(/<br[^>]*>/).inject({}){ |hash, entry|
          key = entry[/<!--(.*?)-->/, 1].strip
          value = Scraper.normalize_whitespace(Hpricot(entry).inner_text)
          hash[key] = value
          hash
        }
      end

    end
  end
end
