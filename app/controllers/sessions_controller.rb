class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env['omniauth.auth']
    user = User.find_by(twitter_id: auth['uid'])
    @current_user = user
    
    if user
      reset_session
      session[:user_id] = auth['uid']
      session[:name] = auth['info']['name']
      session[:nickname] = auth['info']['nickname']
      session[:oauth_token] = auth['credentials']['token']
      session[:oauth_token_secret] = auth['credentials']['secret']
      redirect_to root_path, notice: 'Login successed'
    else
      redirect_to root_path, alert: 'Login Failed'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout successed'
  end
end
