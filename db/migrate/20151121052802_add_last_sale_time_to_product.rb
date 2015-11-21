class AddLastSaleTimeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :last_sale_time, :datetime
  end
end
