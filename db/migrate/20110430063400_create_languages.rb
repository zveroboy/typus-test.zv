class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :name
      t.boolean :active

      t.timestamps
    end
    Language.create_translation_table! :name => :string
  end

  def self.down
    drop_table :languages
	Language.drop_translation_table!
  end
end
