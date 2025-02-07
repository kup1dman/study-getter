class AddOrdersReferenceToGroups < ActiveRecord::Migration[8.0]
  def change
    add_reference :groups, :order, foreign_key: true
  end
end
