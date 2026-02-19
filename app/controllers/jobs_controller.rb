class JobsController < ApplicationController
    before_action :set_job, only: [:show, :edit, :update, :destroy]
    before_action :require_admin_or_staff, except: [:index, :show]

    def index
        if current_user.admin? || current_user.staff?
            @jobs = Job.all
        else
            @jobs = Job.open
        end
    end

    def show
    end

    def new
        @job = Job.new
    end
    
    def create
        @job = Job.new(job_params)
        @job.created_by = current_user

        if @job.save
            redirect_to jobs_path, notice: "Job was successfully created."
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @job.update(job_params)
            redirect_to jobs_path, notice: "Job was successfully updated."
        else
            render :edit, notice: "Failed to update job." 
        end
    end

    def destroy
        @job.destroy
        redirect_to jobs_path, notice: "Job was successfully deleted."
    end

    private

    def set_job
        @job = Job.find(params[:id])
    end

    def job_params
        params.require(:job).permit(:title, :description, :location, :status)
    end

end
