class OrderitemsController < ApplicationController
  def create
    # debugger
    @product = Product.find(params[:product_id])
    @orderitem = @product.orderitems.new
    @orderitem.price = @product.current_price
    @orderitem.quantity = 1
    @orderitem.save

    redirect_to products_path
  end

  def index
  end
end
