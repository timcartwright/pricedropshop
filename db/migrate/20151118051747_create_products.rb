class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.decimal :min_price
      t.decimal :max_price
      t.decimal :start_price
      t.decimal :current_price

      t.timestamps null: false
    end
  end
end
