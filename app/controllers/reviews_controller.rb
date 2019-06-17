class ReviewsController < ApplicationController
  before_filter :deny_access, :unless => :user_logged_in?
  
  def create
    @product = Product.find(params['product_id'])
    rating = params['review']['rating']
    description = params['review']['description']
    @review = @product.reviews.create(rating: rating, description: description)
    @review.user = current_user
    if @review.save
      redirect_to '/'
    else
      redirect_to '/products/:product_id'
    end
  end

  protected

  def user_logged_in?
    session[:user_id]
  end

end
