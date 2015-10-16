class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def store_return_to
    session[:return_to] = request.url
  end

  def after_sign_in_path_for(resource)
  	session.delete(:return_to) || current_user
  end

=begin 
  def redirect_back_or_default(default)
  	http://stackoverflow.com/questions/9489660/return-user-to-previous-page-after-login-rails
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
end
=end 
end
