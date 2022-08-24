class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    if user_signed_in?
      render current_user.is_seller ? 'restaurants/index' : 'pages/home'
    end
  end
end
