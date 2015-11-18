class OrdersController < ApplicationController
  def index
  end

  def create
    # debugger
    @product = Product.find(params[:product_id])
    @order = @product.orders.new
    @order.user = current_user
    @order.price = @product.current_price
    @order.paid = false
    @order.dispatched = false
    @order.save

    redirect_to products_path

  end

  def edit
  end

  def show
  end
end
