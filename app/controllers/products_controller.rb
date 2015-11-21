class ProductsController < ApplicationController

  skip_before_filter :authenticate_user!, only: [:index, :show]
  before_filter :find_product, only: [:show, :edit, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @new_orderitem = @product.orderitems.new
  end

  def create
    @product = current_user.products.new(product_params)
    @product.last_sold_price = params[:start_price]
    @product.last_sale_time = DateTime.now
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

private
  def product_params
    params.require(:product).permit(:title, :description, :image, :quantity, :min_price, :max_price, :start_price)
  end

  def find_product
    @product = Product.find(params[:id])
  end

end