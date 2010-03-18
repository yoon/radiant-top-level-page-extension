class AddPageIdFieldToUser < ActiveRecord::Migration
  def self.up
    add_column "users", "top_level_page_id", :integer
  end

  def self.down
    remove_column "users", "top_level_page_id" 
  end
end