class UserSitesController < ApplicationController
  def create
	@user_site = UserSite.new(params[:user_site]) 
	# raise @user_site.to_yaml
    if @user_site.save 
	  redirect_to(root_path, :notice => 'Site was successfully updated.')
    else
      redirect_to(root_path, :notice => @user.errors.to_s)
    end 
  end
end
