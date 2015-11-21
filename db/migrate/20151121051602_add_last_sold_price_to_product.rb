class AddLastSoldPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :last_sold_price, :decimal, scale: 2, precision: 6
  end
end