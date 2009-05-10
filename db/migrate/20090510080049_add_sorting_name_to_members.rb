class AddSortingNameToMembers < ActiveRecord::Migration
  def self.up
    add_column "members", "sorting_name", :string
    Member.all.each do |member|
      member.save!
    end
  end

  def self.down
    remove_column "members", "sorting_name"
  end
end
