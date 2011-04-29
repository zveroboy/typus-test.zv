class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.boolean :active

      t.timestamps
    end
    Category.create_translation_table! :name => :string
  end

  def self.down
    drop_table :categories
	Category.drop_translation_table!
  end
end
