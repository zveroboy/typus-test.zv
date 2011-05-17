class SitesController < ApplicationController
  def index
	session[:cat] = params[:cat].nil? ? [] : params[:cat].map!{ |e| e.to_i }
	session[:lang] = params[:lang].nil? ? [] : params[:lang].map!{ |e| e.to_i } #unless params[:lang].nil?
	# raise session.to_yaml
	# unless params[:lang].blank? || params[:cat].blank? then
		# @site = Site.first
		# redirect_to @site
	# end
	sites = Site.where(:active => true).joins(:categories, :languages).order("id")
	sites = sites.where(:categories => {:id=>session[:cat]}) unless session[:cat].blank?
	sites = sites.where(:languages => {:id=>session[:lang]}) unless session[:lang].blank?
	# sites = sites.first
	# raise sites.to_yaml
	redirect_to :action => "show", :id => sites.first.id unless sites.blank?
  end
  def show
	sites = Site.where(:active => true).joins(:categories, :languages).group("id").order("id")
	# sites = sites.joins("LEFT OUTER JOIN categories_sites ON categories_sites.site_id = sites.id")
	# sites = sites.joins("LEFT OUTER JOIN categories ON categories.id = categories_sites.category_id")
	# sites = sites.joins("LEFT OUTER JOIN languages_sites ON languages_sites.site_id = sites.id")
	# sites = sites.joins("LEFT OUTER JOIN languages ON languages.id = languages_sites.language_id")
	sites = sites.where(:categories => {:id=>session[:cat]}) unless session[:cat].blank?
	sites = sites.where(:languages => {:id=>session[:lang]}) unless session[:lang].blank?
	# logger.debug "sites: #{sites.to_sql}"
	# raise session.to_yaml
	# logger.debug "params[:id]: #{params[:id].to_i}"
	cur_index = 0
	sites.each_with_index do |s, i|
	  # logger.debug "i: #{i}"
	  # logger.debug "s.id: #{s.id}"
	  # logger.debug "b: #{params[:id].to_i == s.id}"
	  cur_index = i if params[:id].to_i == s.id
	  @site = s if params[:id].to_i == s.id
      @site_categories = s if params[:id].to_i == s.id
	end
	if sites.any? && cur_index+1 < sites.size
	  @next = sites[cur_index+1]
	elsif sites.any?
	  @next = sites[0]
	end
	# raise @site.to_yaml
	
	cookies[:history] = {
	  :value => cookies[:history].to_s.split(',').push(params[:id].to_s).uniq.join(','),
	  :expires => 1.week.from_now
	}
	# raise cookies.to_yaml
	render :index
  end
  def rate
	if params[:rating] && current_user
	  @site = Site.find(params[:id])
	  @rating = @site.ratings.build(params[:rating])
	  @rating.user = current_user
		
	  respond_to do |format|
	    if @rating.save
	      format.html { redirect_to :action => "show", :id => params[:id], :notice => 'Thank you for rating this article!'}
	    else
	      format.html { redirect_to :action => "show", :id => params[:id], :notice => 'There was an error saving your rating.'}
	    end   
	  end   
    end
  end
end
