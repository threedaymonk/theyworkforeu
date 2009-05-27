class NewDataModel < ActiveRecord::Migration
  def self.up
    create_table "parliaments" do |t|
      t.date "start_on"
      t.date "end_on"

      t.timestamps
    end

    create_table "debates" do |t|
      t.references "parliament"
      t.date       "sat_on"
      t.string     "location"

      t.timestamps
    end

    create_table "sections" do |t|
      t.text       "original_title"
      t.text       "translated_title"
      t.integer    "level"
      t.references "debate"
      t.references "language"

      t.timestamps
    end

    create_table "groupings" do |t|
      t.text "name"

      t.timestamps
    end

    create_table "affiliations" do |t|
      t.references "grouping"
      t.references "parliament"
      t.references "party"

      t.timestamps
    end

    create_table "countries" do |t|
      t.string "code", :limit => 2
      t.string "name"

      t.timestamps
    end

    create_table "languages" do |t|
      t.string "code", :limit => 2
      t.string "name"

      t.timestamps
    end

    create_table "party" do |t|
      t.references "country"
      t.text       "name"

      t.timestamps
    end

    create_table "membership" do |t|
      t.references "party"
      t.references "parliament"
      t.references "person"

      t.timestamps
    end

    create_table "person" do |t|
      t.text       "name"
      t.string     "sorting_name"
      t.references "country"
      t.date       "born_on"
      t.integer    "ep_member_id"
      t.boolean    "mep"

      t.timestamps
    end

    create_table "contribution" do |t|
      t.references "person"
      t.references "section"
      t.text       "original_text"
      t.text       "translated_text"
      t.references "language"

      t.timestamps
    end

    create_table "terms" do |t|
      t.string "term"

      t.timestamps
    end

    create_table "term_occurrences" do |t|
      t.references "debate"
      t.references "term"

      t.timestamps
    end
  end

  def self.down
  end
end
