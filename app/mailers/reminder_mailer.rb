class ReminderMailer < ApplicationMailer
    def reminder_notification(reminder)
      @reminder = reminder
@job_application = reminder.job_application
return if @job_application.nil?

@job = @job_application.job
      @candidate = @job_application.candidate
      @staff = @job.created_by

        mail(to: @staff.email, subject: "Reminder: Upcoming Job Application Follow-up for #{@job.title}")

end
end