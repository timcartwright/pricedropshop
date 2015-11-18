class OrderitemsController < ApplicationController
  def create
    # debugger
    
    @order = current_user.orders.find_by(paid: false, dispatched: false) || current_user.orders.new

    @order.paid = false
    @order.dispatched = false
    @order.save!

    @orderitem = @order.orderitems.new       

    @product = Product.find(params[:product_id])
    @orderitem.product = @product
    
    @orderitem.price = @product.current_price
    @orderitem.quantity = 1
    @orderitem.save

    redirect_to products_path
  end

  def index
  end
end
