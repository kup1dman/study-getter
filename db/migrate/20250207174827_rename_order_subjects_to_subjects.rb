class RenameOrderSubjectsToSubjects < ActiveRecord::Migration[8.0]
  def change
    rename_table :order_subjects, :subjects
  end
end
