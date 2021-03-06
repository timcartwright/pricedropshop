class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.decimal :price
      t.boolean :paid
      t.boolean :dispatched

      t.timestamps null: false
    end
  end
end
