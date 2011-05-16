class Rating < ActiveRecord::Base
  belongs_to :site
  belongs_to :user
  
  attr_accessible :value
  
  validates :user_id, :presence => true
  validates :sitee_id, :presence => true
  validates :value, :presence => true, :numericality => true, :inclusion => { :in => 1..5 }
end
