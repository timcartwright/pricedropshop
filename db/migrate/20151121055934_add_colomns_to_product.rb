class AddColomnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :min_price, :decimal, scale: 2, precision: 6
    add_column :products, :max_price, :decimal, scale: 2, precision: 6
    add_column :products, :start_price, :decimal, scale: 2, precision: 6
  end
end
