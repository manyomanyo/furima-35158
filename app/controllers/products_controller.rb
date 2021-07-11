class ProductsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @users = User.all
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end
  # def destroy
  #   product.destroy
  #   redirect_to root_path
  # end

  private

  def product_params
    params.require(:product).permit(
      :image, :name, :description, :price, :item_state_id, :category_id, :delivery_fee_id, :delivery_day_id, :user_area_id
    ).merge(user_id: current_user.id)
  end

end
