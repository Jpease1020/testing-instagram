class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :log_in, :log_out, :logged_in?, :logged_out?
  before_action :logged_in?

  def logged_in?
    current_user.nil?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.clear
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_out?
    session[:user_id] == nil
  end

end
