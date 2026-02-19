class AddNullConstraintToJobsCreator < ActiveRecord::Migration[8.1]
  def change
    change_column_null :jobs, :created_by_id, false
  end
end
