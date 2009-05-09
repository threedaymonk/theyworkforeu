class CreateSittings < ActiveRecord::Migration
  def self.up
    create_table :sittings do |t|
      t.date :sat_on
      t.string :location

      t.timestamps
    end
  end

  def self.down
    drop_table :sittings
  end
end
