class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,:logged_in?
  before_action :access_redirect,except: [:create,:new]

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def access_redirect
    unless logged_in?
      redirect_to '/session/new'
    end
  end
end
