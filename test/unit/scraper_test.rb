require File.join(File.dirname(__FILE__), "..", "test_helper")

class ScraperTest < Test::Unit::TestCase

  should "construct URL for plenary sessions debate on specified date" do
    assert_equal "http://www.europarl.europa.eu/sides/getDoc.do?pubRef=-//EP//TEXT+CRE+20090506+ITEMS+DOC+XML+V0//EN&language=EN", Europarl::Scraper.debates_url(Date.new(2009, 5, 6))
  end
end
