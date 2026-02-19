class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!
  private
  def require_admin_or_staff
    unless current_user.admin? || current_user.staff?
      redirect_to root_path, alert: "You do not have access to this section."
    end
  end

  def require_candidate
    unless current_user.candidate?
      redirect_to root_path, alert: "You do not have access to this section."
    end
  end
  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes
end
