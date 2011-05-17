class UserSitesController < ApplicationController
  # def new
    # @user_site = UserSite.new
    # @categories = Category.where(:active=>true)
    # render "layouts/form"
  # end

  def create
	@user_site = UserSite.new(params[:user_site]) 
    if @user_site.save 
	  redirect_to(root_path, :flash => { :user_site => { :notice => I18n.t("user_side.notice") } } )
    else
	# raise @user_site.errors.to_yaml
	  # flash[:user_site] = @user_site.errors
      redirect_to(root_path, :flash => { :user_site => { :errors => @user_site.errors } } )
    end 
  end
end
