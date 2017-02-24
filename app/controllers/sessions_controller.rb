class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: params[:user_id])
    @current_user = user
    if user
      reset_session
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login successed'
    else
      redirect_to root_path, alert: 'Login Failed'
    end
  end

  def destroy
      reset_session
      redirect_to '/session/new', notice: 'Logout successed'
  end
end
