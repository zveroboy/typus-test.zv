class CreateSites2Lang < ActiveRecord::Migration
  def self.up
	create_table :sites2languages, :id => false do |t| 
      t.references :site 
      t.references :language 
    end 
  end

  def self.down
	drop_table :sites2languages 
  end
end
