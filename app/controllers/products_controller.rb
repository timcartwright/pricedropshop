class ProductsController < ApplicationController

  skip_before_filter :authenticate_user!, only: :index

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    @new_order = @product.orders.new
  end

  def create
    @product = current_user.products.new(product_params)
    # debugger
    @product.current_price = params[:product][:start_price]
    @product.save
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

private
  def product_params
    params.require(:product).permit(:title, :description, :image, :quantity, :min_price, :max_price, :start_price)
  end

end