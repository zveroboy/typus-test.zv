class UserSite < ActiveRecord::Base
  belongs_to :category
  validates :url, :presence => true, :format => { :with => /^(?:(?:http|https):\/\/)?(?:www\.)?((?:[a-zA-Z0-9](?:[a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})/, :on => :create, :message => I18n.t("user_side.invalid_url") }
  
  def domain
	self.url.match(/^(?:(?:http|https):\/\/)?(?:www\.)?((?:[a-zA-Z0-9](?:[a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})/)[1]
  end
end
