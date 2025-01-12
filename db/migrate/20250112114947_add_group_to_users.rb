class AddGroupToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :group, :string
    add_reference :users, :executor, index: true
  end
end
