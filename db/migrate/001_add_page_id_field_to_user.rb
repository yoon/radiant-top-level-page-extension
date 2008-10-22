class AddPageIdFieldToUser < ActiveRecord::Migration
  def self.up
    add_column "users", "page_id", :integer
  end

  def self.down
    remove_column "users", "page_id" 
  end
end