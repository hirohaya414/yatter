class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  add_flash_types :success, :danger, :warning, :info

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :school_year])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :school_year, :profile_image_id, :is_deleted])
  end
end
