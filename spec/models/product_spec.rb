require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should be created with all fields defined' do
      @category = Category.new
      @category.save
      @product = @category.products.create(name: "ball", price: 5, quantity: 15)
      expect(@product.id).to be_present
    end
  # validation tests/examples here
  end
end
