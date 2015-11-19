class OrderitemsController < ApplicationController
  def create
    # debugger
    
    @order = current_user.orders.find_by(paid: false, dispatched: false) || current_user.orders.new

    @order.paid = false
    @order.dispatched = false
    @order.save!

    @orderitem = @order.orderitems.new       

    @product = Product.find(params[:product])
    @orderitem.product = @product
    
    @orderitem.price = @product.current_price
    @orderitem.quantity = 1
    @orderitem.save

    redirect_to orderitems_path
  end

  def index
    @order = current_user.orders.find_by(paid: false, dispatched: false)
    @orderitems = @order.orderitems

    @ordertotal = 0
    @orderitems.each do |item|
      @ordertotal += item.price
    end
    
  end

  def destroy
    # debugger
    @orderitem = Orderitem.find(params[:id])
    @orderitem.destroy
    redirect_to orderitems_path
  end
end
