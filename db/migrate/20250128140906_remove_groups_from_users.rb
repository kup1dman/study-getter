class RemoveGroupsFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :group, :string
  end
end
