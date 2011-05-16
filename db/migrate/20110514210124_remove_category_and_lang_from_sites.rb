class RemoveCategoryAndLangFromSites < ActiveRecord::Migration
  def self.up
    remove_column :user_sites, :category_id
    remove_column :user_sites, :language_id
  end

  def self.down
    add_column :user_sites, :category_id, :integer
    add_column :user_sites, :language_id, :integer
  end
end
