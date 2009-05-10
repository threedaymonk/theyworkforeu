class SittingsAddTagsColumn < ActiveRecord::Migration
  def self.up
    add_column 'sittings', 'tags', :string
  end

  def self.down
    remove_column 'sittings', 'tags'
  end
end
