require File.join(File.dirname(__FILE__), "..", "test_helper")

class MemberScraperTest < ActiveSupport::TestCase

  should "find URL for member be EP member ID" do
    expected = "http://www.europarl.europa.eu/members/public/geoSearch/view.do?language=EN&id=4524"
    actual   = Europarl::Scraper::Member.member_url(4524)
    assert_equal expected, actual
  end

  examples = {
    1 => {
      :name          => "Gerard BATTEN",
      :group         => "Independence/Democracy Group",
      :party         => "UK Independence Party",
      :country       => "gb",
      :date_of_birth => Date.new(1954, 3, 27)
    },
    2 => {
      :name          => "Caroline LUCAS",
      :group         => "Group of the Greens/European Free Alliance",
      :party         => "Green Party",
      :country       => "gb",
      :date_of_birth => Date.new(1960, 12, 9)
    },
    3 => {
      :name          => "Emmanouil ANGELAKAS",
      :group         => "Group of the European People's Party (Christian Democrats) and European Democrats",
      :party         => "Nea Dimokratia",
      :country       => "gr",
      :date_of_birth => Date.new(1960, 11, 26)
    }
  }

  examples.each do |number, data|
    context "when parsing example ##{number}" do
      setup do
        @member = Europarl::Scraper::Member.new(html_sample("member_#{number}"))
      end

      data.each do |method, value|
        should "find the #{method}" do
          assert_equal value, @member.__send__(method)
        end
      end
    end
  end

end

