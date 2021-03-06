class UserSessionsController < ApplicationController
  # skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:name], params[:password])
      redirect_to events_url
    else
      flash.now[:notice] = 'Login failed'
      render action: 'new'
    end
  end
  
  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end
