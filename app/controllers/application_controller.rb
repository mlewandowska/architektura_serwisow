class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :is_logon_user?, :user_email

before_filter :set_locale

  def set_locale
    I18n.locale = params[:locale]
  end
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

private
def is_logon_user?
	if session[:user_id]
		true
	else
		false
	end
end

private
def user_email
	if session[:user_id]
		User.find(session[:user_id]).email
	end
end

end
