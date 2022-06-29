class Admin::DashboardController < ApplicationController
  
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASS']

  def show
    @category_count = Category.distinct.count()

    @product_count = Product.distinct.count()
  end
end
