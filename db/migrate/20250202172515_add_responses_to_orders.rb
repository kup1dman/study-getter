class AddResponsesToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :response, :integer, default: 0
  end
end
