class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = current_user.products.new(product_params)
    @product.save
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:title, :description, :image, :quantity, :min_price, :max_price, :start_price)
  end

end