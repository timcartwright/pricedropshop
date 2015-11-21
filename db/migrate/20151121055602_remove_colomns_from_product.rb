class RemoveColomnsFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :min_price, :decimal
    remove_column :products, :max_price, :decimal
    remove_column :products, :start_price, :decimal
    remove_column :products, :current_price, :decimal
  end
end
