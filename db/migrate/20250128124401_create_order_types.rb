class CreateOrderTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :order_types do |t|
      t.string :name
      t.references :order, index: true, foreign_key: true

      t.timestamps
    end
  end
end
