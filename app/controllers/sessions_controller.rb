class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.set_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout successed'
  end
end
