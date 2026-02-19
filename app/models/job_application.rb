class JobApplication < ApplicationRecord
  enum :status, {
    applied: 0,
    screening: 1,
    interview: 2,
    offer: 3,
    hired: 4,
    rejected: 5
  }
validate :job_must_be_open, on: :create

def job_must_be_open
  errors.add(:base, "Job is closed") unless job.open?
end

  belongs_to :job
  belongs_to :candidate, class_name: "User"

  has_many :notes, dependent: :destroy
  has_many :reminders, dependent: :destroy
end
