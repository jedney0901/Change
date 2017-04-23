class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :configure_permitted_parameters, if: :devise_controller?


protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :image_cache])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :image_cache, :remove_image])
    end


  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(root_path)
    end


end
