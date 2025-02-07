class RenameOrderTypesToTypes < ActiveRecord::Migration[8.0]
  def change
    rename_table :order_types, :types
  end
end
