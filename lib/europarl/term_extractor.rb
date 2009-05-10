require 'net/http'
require 'uri'
require 'hpricot'

module Europarl
  class TermExtractor

    EXTRACTION_URL = URI.parse('http://search.yahooapis.com/ContentAnalysisService/V1/termExtraction')

    def self.extract(text, query=nil)
      res = Net::HTTP.post_form(EXTRACTION_URL, { 'appid'=>YAHOO_APP_ID, 'context'=>text, 'query'=>query} )
      ((Hpricot.XML(res.body))/"Result").map { |x| x.inner_text }
    end

  end
end
