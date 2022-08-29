class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # devise
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # pundit
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password address phone is_seller])

    devise_parameter_sanitizer.permit(:sign_in, keys: %i[phone password])

    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password address phone is_seller])
  end

  def after_sign_in_path_for(_resource)
    root_path
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
