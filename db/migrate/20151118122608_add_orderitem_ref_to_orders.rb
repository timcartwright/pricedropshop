class AddOrderitemRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :orderitem, index: true, foreign_key: true
  end
end
