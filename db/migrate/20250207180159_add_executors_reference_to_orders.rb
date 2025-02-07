class AddExecutorsReferenceToOrders < ActiveRecord::Migration[8.0]
  def change
    add_reference :orders, :executor, index: true
  end
end
