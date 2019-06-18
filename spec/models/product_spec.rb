require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    subject {
      @category = Category.new
      @category.save
      described_class.new(
        name: "ball", 
        price_cents: 5, 
        quantity: 15, 
        category: @category)
    }

    it 'should be created with all fields defined' do
      expect(subject).to be_valid
    end

    it 'should not be created without a name defined' do
      subject.name = nil
      subject.save
      expect(subject.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not be created without a price defined' do
      subject.price_cents = nil
      subject.save
      expect(subject.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not be created without a quantity defined' do
      subject.quantity = nil
      subject.save
      expect(subject.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should be not be created without a category defined' do
      subject.category = nil
      subject.save
      expect(subject.errors.full_messages).to include("Category can't be blank")
    end

  end
end