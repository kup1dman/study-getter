class CreateUserGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :user_groups do |t|
      t.string :uid
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
