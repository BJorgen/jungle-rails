class ReviewsController < ApplicationController
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
end
