# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090527214933) do

  create_table "affiliations", :force => true do |t|
    t.integer  "grouping_id"
    t.integer  "parliament_id"
    t.integer  "party_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contribution", :force => true do |t|
    t.integer  "person_id"
    t.integer  "section_id"
    t.text     "original_text"
    t.text     "translated_text"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries", :force => true do |t|
    t.string   "code",       :limit => 2
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debates", :force => true do |t|
    t.integer  "parliament_id"
    t.date     "sat_on"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupings", :force => true do |t|
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", :force => true do |t|
    t.string   "code",       :limit => 2
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "membership", :force => true do |t|
    t.integer  "party_id"
    t.integer  "parliament_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parliaments", :force => true do |t|
    t.date     "start_on"
    t.date     "end_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "party", :force => true do |t|
    t.integer  "country_id"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "person", :force => true do |t|
    t.text     "name"
    t.string   "sorting_name"
    t.integer  "country_id"
    t.date     "born_on"
    t.integer  "ep_member_id"
    t.boolean  "mep"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", :force => true do |t|
    t.text     "original_title"
    t.text     "translated_title"
    t.integer  "level"
    t.integer  "debate_id"
    t.integer  "language_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "term_occurrences", :force => true do |t|
    t.integer  "debate_id"
    t.integer  "term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terms", :force => true do |t|
    t.string   "term"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
