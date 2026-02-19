class DropApplicationsTable < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :notes, column: :job_application_id
    remove_foreign_key :applications, :jobs
    remove_foreign_key :applications, :users, column: :candidate_id
    drop_table :applications
    add_foreign_key :notes, :job_applications
  end
end
