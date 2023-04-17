class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer :shipping_fee, null: false
      t.integer :amount_billed, null: false
      t.integer :payment_method, default: 0, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
