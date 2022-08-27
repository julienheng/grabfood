class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home]

  def home
    @restaurant = Restaurant.new
    if params[:query].present?
      @restaurants = Restaurant.search_by_name_and_category(params[:query])
    else
      @restaurants = Restaurant.all
    end

    if user_signed_in?
      if current_user.is_seller && current_user.restaurants.count.zero?
        render 'restaurants/new'
      elsif current_user.is_seller && current_user.restaurants.count >= 1
        render 'restaurants/index'
      elsif !current_user.is_seller
        render 'pages/home'
      end
    end
  end
end
