class AddLang2Sites < ActiveRecord::Migration
  def self.up
	add_column :sites, :language_id, :integer
  end

  def self.down
	remove_column :sites, :language_id
  end
end
