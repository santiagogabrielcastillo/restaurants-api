class Api::V1::CommentsController < Api::V1::BaseController
  before_action :set_restaurant, only: %I[show]

  def show
    @comment = @restaurant.comments.find(params[:id])
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    authorize @restaurant
  end
end
