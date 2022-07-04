require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do 
      @category = Category.new name: 'Test plants'
      @product = @category.products.new({ name: 'Testing plant', description: 'Testing plant is a test plant that howls every time you pass by and gets upset if the test fails.', quantity: 7, price: 35})
    end

    context "when adding a new product to the database" do
      it "saves an item successfully if all fields are validated" do
        expect(@product.save).to eq true
      end

      it "fails to save the new product when it is missing name" do
        @product.name = nil
        @product.save
        expect(@product.errors.full_messages).to include ("Name can't be blank")
      end

      it "fails to save the new product when it is missing quantity" do
        @product.quantity = nil
        @product.save
        expect(@product.errors.full_messages).to include ("Quantity can't be blank")
      end

      it "fails to save the new product when it is missing price" do
        @product.price = nil
        @product.price_cents = nil
        @product.save
        puts @product.errors.full_messages
        expect(@product.errors.full_messages).to include ("Price can't be blank")
      end

      it "fails to save the new product when it is missing category" do
        @product2 = Product.new({ name: 'Testing plant', quantity: 8, price: 35, category: nil })
        puts @product2.inspect
        @product2.save
        expect(@product2.errors.full_messages).to include ("Category can't be blank")

      end

    end
  end
end