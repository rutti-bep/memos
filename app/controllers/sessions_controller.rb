class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env['omniauth.auth']
    if auth['info']['nickname'] == ENV['NICKNAME'] then
      session[:user_id] = auth['uid']
      session[:name] = auth['info']['name']
      session[:nickname] = auth['info']['nickname']
      session[:oauth_token] = auth['credentials']['token']
      session[:oauth_token_secret] = auth['credentials']['secret']
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout successed'
  end
end
