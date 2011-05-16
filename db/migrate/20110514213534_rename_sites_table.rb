class RenameSitesTable < ActiveRecord::Migration
  def self.up
	rename_table :sites2categories, :categories_sites
	rename_table :sites2languages, :languages_sites
  end

  def self.down
	rename_table :categories_sites, :sites2categories
	rename_table :languages_sites, :sites2languages
  end
end
