class ChargesController < ApplicationController
  
  def create
    @amount = params[:amount].to_i

    customer = Stripe::Customer.create(
      email:  params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       @amount,
      description:  'Rails Test Customer',
      currency:     'usd'
    )
    
    order_id = params[:orderid]
    
    mark_order_as_paid(order_id)
    update_product_details(order_id)

    flash[:notice] = 'Your Payment was Successful - Thank you!'
    redirect_to products_path

  rescue Stripe::CardError => e
    flash[:error] = e.message

  end

private
  
  def update_product_details(order_id)
    price_increase_factor = 0.01
    orderitems = Orderitem.where(order_id: order_id)

    orderitems.each do |item|
      item.product.update_quantity(item.quantity)
      item.product.update_last_sold_price(item.price)
    end

  end

  def mark_order_as_paid(order_id)
    order = Order.find(order_id)
    order.mark_as_paid
  end

end
