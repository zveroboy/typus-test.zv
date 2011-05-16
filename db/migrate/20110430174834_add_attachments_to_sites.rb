class AddAttachmentsToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :category_id, 		 :integer
    add_column :sites, :picture_file_name,    :string
    add_column :sites, :picture_content_type, :string
    add_column :sites, :picture_file_size,    :integer
    add_column :sites, :picture_updated_at,   :datetime
  end

  def self.down
    remove_column :sites, :category_id 
    remove_column :sites, :picture_file_name
    remove_column :sites, :picture_content_type
    remove_column :sites, :picture_file_size
    remove_column :sites, :picture_updated_at
  end
end
