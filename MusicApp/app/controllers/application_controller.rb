class ApplicationController < ActionController::Base
  helper_method :current_user, :logout!

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    @current_user = user
    session[:session_token] = @current_user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
    
  end

  def logged_in?
    !!@current_user
  end

end
