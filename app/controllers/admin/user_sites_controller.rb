class Admin::UserSitesController < Admin::ResourcesController
  def show_top
	raise params.to_yaml
	# @resource = UserSite.find(:all)
    render 'admin/user_sites/show_top'
  end
end
