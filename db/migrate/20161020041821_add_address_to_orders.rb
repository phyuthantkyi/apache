class AddAddressToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :address1, :string
    add_column :orders, :address2, :string
  end
end
