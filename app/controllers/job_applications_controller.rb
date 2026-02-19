class JobApplicationsController < ApplicationController
    before_action :set_job, only: [:new, :create]
    before_action :set_job_application, only: [:show, :update, :destroy]

    def index
        if current_user.admin? || current_user.staff?
            @job_applications = JobApplication.all
        else
            @job_applications = current_user.job_applications
        end
        if params[:status].present?
            @job_applications = @job_applications.where(status: params[:status])
        end
    end

    def show
        unless authorized_to_view?(@job_application)
            redirect_to job_applications_path, alert: "You do not have access to this application."
        end
    end
    
    def new
        require_candidate
        @job_application = @job.job_applications.new
    end

    def create
        require_candidate

        unless @job.open?
            redirect_to jobs_path, alert: "This job is closed and cannot accept applications."
            return
        end
        @job_application = @job.job_applications.new(job_application_params)
        @job_application.candidate_id = current_user.id
        @job_application.status = :applied

        if @job_application.save
            redirect_to @job_application, notice: "Application was successfully submitted."
        else
            render :new
        end
    end


    before_action :require_admin_or_staff, only: [:update]

    def update
        if @job_application.update(status: params[:job_application][:status])
            redirect_to @job_application, notice: "Application updated."
        else
            render :show
        end
    end


    def destroy
        require_admin_or_staff
        @job_application.destroy
        redirect_to job_applications_path, notice: "Application was successfully deleted."
    end

    private

    def set_job
        @job = Job.find(params[:job_id])
    end

    def set_job_application
        @job_application = JobApplication.find(params[:id])
    end

    def job_application_params
        params.require(:job_application).permit(:resume, :cover_letter)
    end

    def authorized_to_view?(application)
        return true if current_user.admin? || current_user.staff?
        application.candidate_id == current_user.id
    end
end