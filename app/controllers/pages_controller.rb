class PagesController < ApplicationController
  def index
    # @sites = Site.where(:active=>true)
	# @session = session 
	# raise session.to_yaml
  end
  def about
  end
  def sign_in
	render :layout => false
  end
end
