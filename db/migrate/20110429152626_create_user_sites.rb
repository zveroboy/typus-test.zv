class CreateUserSites < ActiveRecord::Migration
  def self.up
    create_table :user_sites do |t|
      t.string :domain
      t.string :url
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_sites
  end
end
