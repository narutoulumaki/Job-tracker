# Preview all emails at http://localhost:3000/rails/mailers/reminder_mailerrails_mailer
class ReminderMailerrailsMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/reminder_mailerrails_mailer/generate
  def generate
    ReminderMailerrailsMailer.generate
  end

  # Preview this email at http://localhost:3000/rails/mailers/reminder_mailerrails_mailer/mailer
  def mailer
    ReminderMailerrailsMailer.mailer
  end

  # Preview this email at http://localhost:3000/rails/mailers/reminder_mailerrails_mailer/ReminderMailer
  def ReminderMailer
    ReminderMailerrailsMailer.ReminderMailer
  end
end
