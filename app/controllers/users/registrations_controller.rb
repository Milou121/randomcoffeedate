module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    protected

    def after_sign_up_path_for(resource)
      UserMailer.registration_confirmation(resource).deliver_now
      edit_profile_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit(:email, :password, :password_confirmation, :remember_me, :username, :photo, :photo_cache)
      end

      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:email, :current_password, :password, :password_confirmation, :remember_me, :username, :photo, :photo_cache)
      end
    end
  end
end
