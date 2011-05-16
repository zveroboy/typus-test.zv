class Site < ActiveRecord::Base
  has_many :ratings, :dependent => :destroy
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :languages
  if defined?(Paperclip)
	has_attached_file :picture, :styles => { :thumb => "100x100>",  :small => "200x200>", :medium => "600x600>" }
	validates_attachment_presence :picture
	validates_attachment_size :picture, :less_than => 5.megabytes
	validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/gif', 'image/png']
  end
  
  # def
end
