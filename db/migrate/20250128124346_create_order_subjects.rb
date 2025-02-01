class CreateOrderSubjects < ActiveRecord::Migration[8.0]
  def change
    create_table :order_subjects do |t|
      t.string :name
      t.references :order, index: true, foreign_key: true

      t.timestamps
    end
  end
end
