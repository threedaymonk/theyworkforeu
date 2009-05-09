class AddTypeToContribution < ActiveRecord::Migration
  def self.up
    add_column "contributions", "type", :string
  end

  def self.down
    remove_column "contributions", "type"
  end
end
