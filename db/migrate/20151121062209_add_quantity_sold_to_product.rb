class AddQuantitySoldToProduct < ActiveRecord::Migration
  def change
    add_column :products, :quantity_sold, :integer
  end
end
