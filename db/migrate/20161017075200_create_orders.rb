class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.string :address
      t.string :address
      t.string :address
      t.integer :phone
      t.references :product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
