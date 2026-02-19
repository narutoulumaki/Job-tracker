class NotesController < ApplicationController
    before_action :require_admin_or_staff
    before_action :set_job_application

    def create
        @note = @job_application.notes.new(note_params)
        @note.created_by = current_user

        if @note.save
            redirect_to job_application_path(@job_application), notice: "Note was successfully added."
        else
            redirect_to job_application_path(@job_application), alert: "Failed to add note."
        end
    end

    def destroy
        @note = @job_application.notes.find(params[:id])
        @note.destroy
        redirect_to job_application_path(@job_application), notice: "Note was deleted"
    end

    private

    def set_job_application
        @job_application = JobApplication.find(params[:job_application_id])
    end

    def note_params
        params.require(:note).permit(:content)
    end
end