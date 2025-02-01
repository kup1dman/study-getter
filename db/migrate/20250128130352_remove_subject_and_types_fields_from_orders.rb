class RemoveSubjectAndTypesFieldsFromOrders < ActiveRecord::Migration[8.0]
  def change
    remove_column :orders, :subject, :string
    remove_column :orders, :type, :string
  end
end
