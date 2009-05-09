class AddDetailsToMembers < ActiveRecord::Migration
  def self.up
    add_column "members", "country", :string
    add_column "members", "group",   :string
  end

  def self.down
    remove_column "members", "country"
    remove_column "members", "group"
  end
end
