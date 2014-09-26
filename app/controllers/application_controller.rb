class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?

  def configure_devise_params
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :surname, :role, :company_id, :about, :region, :avatar_file_name, :avatar_content_type, :email, :current_password, :password, :password_confirmation)
    end
  end

end
