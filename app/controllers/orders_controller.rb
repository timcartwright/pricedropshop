class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.where(paid: true)
  end
end
