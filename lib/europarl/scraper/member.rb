require 'open-uri'

module Europarl
  module Scraper
    class Member
      MEMBER_URL = "http://www.europarl.europa.eu/members/public/geoSearch/view.do?id=%d"

      def initialize(member)
        @member = member
      end

      def update!
        html = open(MEMBER_URL % @member.euparl_id){ |f| f.read }

        @member.name    = strip(html[%r{<td colspan="3" class="mepname">(.*?)</td>}m, 1])
        @member.group   = strip(html[%r{<span class="titlemep">(.*?)</span>}m, 1])
        @member.country = html[%r{/img/struct/flags/flag_(..).gif}, 1]
        @member.save!
      end

    private

      def strip(s)
        s.gsub(/<[^>]+>/m, '').gsub(/\s+| /m, ' ').strip
      end
    end
  end
end
