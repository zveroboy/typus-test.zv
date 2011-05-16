class Language < ActiveRecord::Base
	has_and_belongs_to_many :sites
	translates :name
	# validates :name, :presence => true
end
