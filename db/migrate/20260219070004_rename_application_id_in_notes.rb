class RenameApplicationIdInNotes < ActiveRecord::Migration[8.1]
  def change
    rename_column :notes, :application_id, :job_application_id
  end
end
