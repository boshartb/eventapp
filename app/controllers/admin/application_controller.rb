class Admin::ApplicationController < ApplicationController
  before_action :redirect_if_not_admin

  def redirect_if_not_admin
    if current_user.admin != true
      flash[:notice] = "Y'ain't got tha permissions to view that, dog."
      redirect_to :root
    end
  end

end