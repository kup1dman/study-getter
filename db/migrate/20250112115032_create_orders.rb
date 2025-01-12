class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :subject
      t.string :type
      t.date :deadline
      t.string :title
      t.integer :status
      t.integer :volume_from
      t.integer :volume_to
      t.text :comment
      t.timestamps

      t.references :user, null: false, index: true, foreign_key: true
    end
  end
end
