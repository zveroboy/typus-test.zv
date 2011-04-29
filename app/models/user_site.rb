class UserSite < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :url
  validates_format_of :url, :with => /^(?:(?:http|https):\/\/)?(?:www\.)?((?:[a-zA-Z0-9](?:[a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6})/i, :on => :create, :message => I18n.t("user_side.invalid_url")
  validates_presence_of :category_id
end
