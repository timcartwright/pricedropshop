class OrderitemsController < ApplicationController

  before_filter :get_open_order, only: [:index, :destroy]

  def create
    product = Product.find(params[:product])
    current_user.buy(product)
    redirect_to orderitems_path
  end

  def index
    if @order
      @orderitems = @order.orderitems
      @ordertotal = @orderitems.map{|i| i.price*i.quantity}.reduce(&:+)
    end
  end

  def destroy
    @orderitem = Orderitem.find(params[:id])
    @orderitem.destroy
    @order.destroy if @order.orderitems.empty?
    redirect_to orderitems_path
  end

private
  def get_open_order
    @order = current_user.orders.find_by(paid: false)
  end
end
