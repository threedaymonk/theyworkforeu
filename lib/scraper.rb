module Europarl
  class Scraper
    DEBATES_URL = 'http://www.europarl.europa.eu/sides/getDoc.do?pubRef=-//EP//TEXT+CRE+%Y%m%d+ITEMS+DOC+XML+V0//EN&language=EN'
    def self.debates_url(date)
      date.strftime(DEBATES_URL)
    end
  end
end
