class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  include ApplicationHelper

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
     devise_parameter_sanitizer.for(:account_update) << :name
  end

  def logged_in_user
    unless logged_in
      store_location
      flash[:danger] = flash_message "please_login"
      redirect_to new_user_session
    end

  end
end
