module ApplicationHelper
  def language_selector 
    if I18n.locale == :en 
      link_to "De", url_for(:locale => 'de') 
    else 
      link_to "En", url_for(:locale => 'en') 
    end 
  end
  def caterory_list
    @categories = Category.where(:active=>true)
    render "layouts/categories"
  end
  def site_add_form
    @user_site = UserSite.new
    @categories = Category.where(:active=>true)
    render "layouts/form"
  end
end
