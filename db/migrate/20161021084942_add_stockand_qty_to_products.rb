class AddStockandQtyToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :stock, :integer
    add_column :products, :qty, :integer
  end
end
