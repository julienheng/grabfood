class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    render 'restaurants/index' if current_user.is_seller?
  end
end
