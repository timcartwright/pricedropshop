class ChargesController < ApplicationController
  
  def create
    # debugger
    @amount = params[:amount].to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Test Customer',
      :currency    => 'usd'
    )
    
    order_id = params[:orderid];
    @order = Order.find(order_id)
    @order.paid = true
    @order.save!

    update_prices(order_id)

    flash[:notice] = 'Your Payment was Successful - Thank you!'
    redirect_to products_path

  rescue Stripe::CardError => e
    flash[:error] = e.message

  end

private
  
  def update_prices(order_id)

    price_increase_factor = 1.01

    orderitems = Orderitem.where(order_id: order_id)

    orderitems.each do |item|
      item.product.current_price *= price_increase_factor
      item.product.save!
    end
  end

end
