class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum :role, { admin: 0, staff: 1, candidate: 2 }

  has_many :created_jobs, class_name: 'Job', foreign_key: 'created_by_id', dependent: :nullify
  has_many :job_applications, foreign_key: 'candidate_id', dependent: :destroy
  has_many :created_notes, class_name: 'Note', foreign_key: 'created_by_id', dependent: :nullify
end
