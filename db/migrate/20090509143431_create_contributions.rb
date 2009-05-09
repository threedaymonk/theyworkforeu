class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.text :original_text
      t.text :translated_text
      t.integer :member_id
      t.integer :sitting_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contributions
  end
end
