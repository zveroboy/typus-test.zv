class AddCatIdToUserSites < ActiveRecord::Migration
  def self.up
    add_column :user_sites, :category_id, :integer
    remove_column :user_sites, :domain
  end

  def self.down
    remove_column :user_sites, :category_id
    add_column :user_sites, :domain, :string
  end
end
