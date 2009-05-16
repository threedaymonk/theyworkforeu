module Europarl
  module Scraper
    NBSP = [0xA0].pack('U')
    def normalize_whitespace(s)
      s.gsub(/(?:\s|#{NBSP}|&nbsp;)+/, " ").strip
    end

    extend self
  end
end
