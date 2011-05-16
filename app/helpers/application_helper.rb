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
  def sites_lang_filter
    @languages = Language.where(:active=>true)
    render "layouts/sites_lang_filter"
  end
  def show_history
	# raise cookies[:history].to_s.split(',').to_yaml
    @sites = Site.where(:id=>cookies[:history].to_s.split(','),:active=>true)
    render "layouts/show_history"
  end
  # def show_rating :site_id
    # (1..5).map do |position|
      # star_image(((@rating-position)*2).round)
    # end.join
  # end
  def errors_for(object, message=nil)
    html = ""
    unless object.errors.blank?
      html << "<div class='formErrors #{object.class.name.humanize.downcase}Errors'>\n"
      if message.blank?
        if object.new_record?
          html << "\t\t<h5>There was a problem creating the #{object.class.name.humanize.downcase}</h5>\n"
        else
          html << "\t\t<h5>There was a problem updating the #{object.class.name.humanize.downcase}</h5>\n"
        end    
      else
        html << "<h5>#{message}</h5>"
      end  
      html << "\t\t<ul>\n"
      object.errors.full_messages.each do |error|
        html << "\t\t\t<li>#{error}</li>\n"
      end
      html << "\t\t</ul>\n"
      html << "\t</div>\n"
    end
    html
  end 
end
