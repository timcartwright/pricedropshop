class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :products
  has_many :orders

  def current_order
    order = self.orders.find_by(paid: false)
    if order.nil?
      order = self.orders.new
      order.paid = false
      order.dispatched = false
      order.save!
    end

    return order
  end

  def buy(product)
    order = current_order

    orderitem = order.orderitems.new
    orderitem.product = product
    orderitem.price = product.current_price
    orderitem.quantity = 1
    orderitem.save!
  end
  
end
