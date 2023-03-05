class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :complete_profile, unless: :devise_controller?
  before_action :configure_permitted_params, if: :devise_controller?

  def complete_profile
    if controller_name != "profiles" && !current_user.profile.complete?
      redirect_to edit_profile_path(current_user.profile)
    end
  end

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday, :sex])
  end
end
