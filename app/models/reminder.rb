class Reminder < ApplicationRecord
  belongs_to :job_application

  validates :remind_at, presence: true
  validates :message, presence: true
  
  scope :pending, -> { where(is_sent: false).where("remind_at <= ?", Time.current) }
end
