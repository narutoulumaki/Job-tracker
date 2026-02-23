namespace :reminders do
  desc "Send pending reminders"

  task send: :environment do
    Reminder.pending.find_each do |reminder|
      reminder.with_lock do
        next if reminder.is_sent?

        ReminderMailer.reminder_notification(reminder).deliver_now
        reminder.update!(is_sent: true)

        puts "Sent reminder ##{reminder.id}"
      end
    end
  end
end