class ProductsController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @product = Product.new
  end

  def destroy
    product.destroy
    redirect_to root_path
  end
end
