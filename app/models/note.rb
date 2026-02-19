class Note < ApplicationRecord
  belongs_to :job_application
  belongs_to :created_by, class_name: 'User'
  validates :content, presence: true
end
