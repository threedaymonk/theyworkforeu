require File.join(File.dirname(__FILE__), "..", "test_helper")

class ScraperTest < ActiveSupport::TestCase

  should "construct URL for plenary sessions debate on specified date" do
    expected = "http://www.europarl.europa.eu/sides/getDoc.do?pubRef="+
               "-//EP//TEXT+CRE+20090506+ITEMS+DOC+XML+V0//EN&language=EN"
    actual   = Europarl::Scraper::Debate.debates_url(Date.new(2009, 5, 6))
    assert_equal expected, actual
  end

  context "when parsing the first sample debate" do
    setup do
      @debate = Europarl::Scraper::Debate.new(html_sample("debate_1"))
    end

    should "extract sitting date" do
      assert_equal Date.new(2009, 5, 6), @debate.date
    end

    should "find all sections ignoring ToC" do
      assert_equal 44, @debate.sections.length
    end

    should "read section titles" do
      actual_titles = @debate.sections.map{ |d| d.title }
      expected_titles =
      ["Opening of the sitting",
       "Support for rural development by the European Agricultural Fund for Rural Development (EAFRD) - Economic Recovery Programme: energy projects - Amendment of the Interinstitutional Agreement of 17 May 2006 (debate)",
       "Credit requirements directives: Directives 2006/48/EC and 2006/49/EC - Community programme for financial services, financial reporting and auditing",
       "Voting time",
       "Responsibilities of committees (B6-0269/2009 )"]
      expected_titles.zip(actual_titles).each do |expected, actual|
        assert_equal expected, actual
      end
    end

    context "in the second section" do
      setup do
        @section = @debate.sections[1]
      end

      should "have fifty-nine contributions" do
        assert_equal 59, @section.contributions.length
      end

      context "in the first contribution" do
        setup do
          @contribution = @section.contributions[0]
        end

        should "extract the member name without trailing punctuation" do
          assert_equal "Der Präsident", @contribution.name
        end
      end

      context "in the second contribution" do
        setup do
          @contribution = @section.contributions[1]
        end

        should "extract the EP member ID from the photo URL" do
          assert_equal 38608, @contribution.ep_member_id
        end

        should "extract the member name without a trailing comma" do
          assert_equal "Петя Ставрева", @contribution.name
        end

        should "find eight paragraphs" do
          assert_equal 8, @contribution.paragraphs.length
        end

        should "extract the first paragraph without the leading attribution string" do
          assert_no_match /Петя Ставрева/, @contribution.paragraphs.first
        end

        should "extract the last paragraph" do
          expected = /^В заключение бих .* региони в Европейския съюз.$/
          assert_match expected, @contribution.paragraphs.last
        end

        should "not clobber name when removing it from first paragraph" do
          @contribution.paragraphs
          assert_equal "Петя Ставрева", @contribution.name
        end
      end

      context "in the twenty-first contribution" do
        setup do
          @contribution = @section.contributions[21]
        end

        should "remove parenthesised affiliation from the contributor's name" do
          assert_equal "Gábor Harangozó", @contribution.name
        end
      end
    end

    context "in an unnested section" do
      setup do
        @section = @debate.sections[1]
      end

      should "be at level 0" do
        assert_equal 0, @section.level
      end
    end

    context "in a nested section" do
      setup do
        @section = @debate.sections[4]
      end

      should "be at level 1" do
        assert_equal 1, @section.level
      end
    end

    context "in a section with is the logical parent of a nested section" do
      setup do
        @section = @debate.sections[3]
      end

      should "be at level 0" do
        assert_equal 0, @section.level
      end
    end

    should "convert ghastly span formatting to semantic markup" do
      expected = "<em>(La séance est levée à 0 h 20)</em>"
      actual   = @debate.sections.last.contributions.first.paragraphs.first
      assert_equal expected, actual
    end
  end

  context "when parsing the second sample debate" do
    setup do
      @debate = Europarl::Scraper::Debate.new(html_sample("debate_2"))
    end

    should "extract sitting date" do
      assert_equal Date.new(2009, 5, 5), @debate.date
    end

    context "when parsing the contribution of a non-MEP" do
      setup do
        @contribution = @debate.sections[2].contributions[5]
      end

      should "have no EP member ID" do
        assert_nil @contribution.ep_member_id
      end

      should "have the name of the contributor" do
        assert_equal "Viviane Reding", @contribution.name
      end
    end
  end
end
