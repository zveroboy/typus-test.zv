class Category < ActiveRecord::Base
	has_and_belongs_to_many :sites
	has_many :user_sites
	translates :name
	# validates :name, :presence => true
end
