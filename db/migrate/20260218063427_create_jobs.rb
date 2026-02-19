class CreateJobs < ActiveRecord::Migration[8.1]
  def change
    create_table :jobs do |t|
      t.string :job_code
      t.string :title
      t.text :description
      t.string :location
      t.integer :status
      t.integer :created_by_id
      
      t.timestamps
    end
    add_index :jobs, :job_code, unique: true
    add_foreign_key :jobs, :users, column: :created_by_id
  end
end
