class CreateJobApplications < ActiveRecord::Migration[8.1]
  def change
    create_table :job_applications do |t|
  t.integer :candidate_id, null: false
  t.references :job, null: false, foreign_key: true
  t.string :resume
  t.text :cover_letter
  t.integer :status, null: false

  t.timestamps
end

add_foreign_key :job_applications, :users, column: :candidate_id
add_index :job_applications, [:candidate_id, :job_id], unique: true

  end
end
