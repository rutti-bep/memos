class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,:logged_in?
  before_action :access_redirect,except: [:index,:create,:show]

  private

  def current_user
    if session[:user_id] != nil
      @current_user ||= User.find_by(twitter_id: session[:user_id])
    else
      nil
    end
  end

  def logged_in?
    current_user != nil
  end

  def access_redirect
    unless logged_in?
      redirect_to root_path, alert:'アクセスできないよん...'
    end
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: 'ログインしてください'
  end
end
