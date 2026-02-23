class RemindersController < ApplicationController
  before_action :require_admin_or_staff
  before_action :set_job_application
  
  def create
    @reminder = job_application.reminders.build(reminder_params)
    
    if @reminder.save
      redirect_to job_application, notice: "Reminder was successfully created."
    else
      redirect_to job_application, alert: "Failed to create reminder."
    end
  end


  def destroy
    @reminder = job_application.reminders.find(params[:id])
    @reminder.destroy
    redirect_to job_application, notice: "Reminder was deleted"
  end

  private
  
  def set_job_application
    @job_application = JobApplication.find(params[:job_application_id])
  end
  
  def reminder_params
    params.require(:reminder).permit(:remind_at, :message)
  end
end
