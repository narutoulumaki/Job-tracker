class FixReminderForeignKey < ActiveRecord::Migration[8.1]
  def change
    rename_column :reminders, :application_id, :job_application_id
    remove_foreign_key :reminders, :applications rescue nil
    add_foreign_key :reminders, :job_applications
  end
end
