class Api::V1::CommentsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: %I[index show]
  before_action :set_restaurant, only: %I[index create]
  before_action :set_comment, only: %I[show update]

  def show
  end

  def index
    @comments = policy_scope(Comment)
    @comments = @comments.where(restaurant_id: @restaurant.id)
    authorize @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    authorize @comment
    @restaurant.comments << @comment
    if @comment.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @comment.update(comment_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    skip_authorization
  end

  def set_comment
    set_restaurant
    @comment = @restaurant.comments.find(params[:id])
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def render_error
    render json: { errors: @comment.errors.full_messages },
      status: :unprocessable_entity
  end
end
