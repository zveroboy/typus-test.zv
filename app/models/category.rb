class Category < ActiveRecord::Base
	has_many :user_sites
	translates :name
	validates :name, :presence => true
end
