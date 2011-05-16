class CreateSites2Categories < ActiveRecord::Migration
  def self.up
	create_table :sites2categories, :id => false do |t| 
      t.references :site 
      t.references :category 
    end 
  end

  def self.down
	drop_table :sites2categories 
  end
end
