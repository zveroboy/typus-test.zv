class AddCategoryToUserSites < ActiveRecord::Migration
  def self.up
    add_column :user_sites, :category_id, :integer
  end

  def self.down
    remove_column :user_sites, :category_id
  end
end
