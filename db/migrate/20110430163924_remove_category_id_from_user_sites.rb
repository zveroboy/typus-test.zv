class RemoveCategoryIdFromUserSites < ActiveRecord::Migration
  def self.up
    remove_column :user_sites, :category_id
  end

  def self.down
    add_column :user_sites, :category_id, :integer
  end
end
