class Job < ApplicationRecord
    enum :status, { open: 0, closed: 1 }
    belongs_to :created_by, class_name: 'User'
    has_many :job_applications, dependent: :destroy

    validates :title, :description, :location, :status, presence: true
    validates :job_code, uniqueness: true

    before_create :generate_job_code

    private

 def generate_job_code
  self.job_code = "JOB-#{SecureRandom.hex(4).upcase}"
end

end

