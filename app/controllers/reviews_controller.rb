class ReviewsController < ApplicationController
  before_filter :user_logged_in?, :only => [:create, :destroy]

  def create
    @product = Product.find(params['product_id'])
    rating = params['review']['rating']
    description = params['review']['description']
    @review = @product.reviews.create(rating: rating, description: description)
    @review.user = current_user
    if @review.save
      redirect_to '/'
    else
      redirect_to product_path(@product)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @product = Product.find(@review.product_id)
    @review.destroy
    redirect_to product_path(@product)
  end

  protected

  def user_logged_in?
    session[:user_id]
  end

end
