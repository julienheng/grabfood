class RegistrationsController < Devise::RegistrationsController
  protected

  # def after_sign_up_path_for(resource)
  #   if current_user.is_seller
  #     '/restaurants' # Or :prefix_to_your_route
  #   else
  #     root_path
  #   end
  # end
end
