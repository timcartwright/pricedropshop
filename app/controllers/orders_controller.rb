class OrdersController < ApplicationController
  def index
  end

  def create
    # debugger
    @product = Product.find(params[:product_id])
    @orderitem = @product.orderitems.new
    @orderitem.price = @product.current_price
    @orderitem.paid = false
    @orderitem.dispatched = false
    @orderitem.save

    redirect_to products_path

  end

  def edit
  end

  def show
  end
end
