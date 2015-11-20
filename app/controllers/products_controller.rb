class ProductsController < ApplicationController

  skip_before_filter :authenticate_user!, only: :index

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = find_product
    @new_orderitem = @product.orderitems.new
  end

  def create
    @product = current_user.products.new(product_params)
    @product.current_price = params[:product][:start_price]
    @product.save
    redirect_to products_path
  end

  def edit
    @product = find_product
  end

  def destroy
    @product = find_product
    @product.destroy
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:title, :description, :image, :quantity, :min_price, :max_price, :start_price)
  end

  def find_product
    Product.find(params[:id])
  end

end