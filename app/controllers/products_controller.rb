class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
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

  def move_to_index
    unless current_user.id == @product.user_id
      redirect_to action: :index
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
