class UserSitesController < ApplicationController
  def create
	@user_site = UserSite.new(params[:user_site]) 
    if @user_site.save 
	  flash[:notice] = "Successfully created project and tasks"
    end 
  end

end
