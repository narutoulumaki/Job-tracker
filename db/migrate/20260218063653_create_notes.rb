class CreateNotes < ActiveRecord::Migration[8.1]
  def change
    create_table :notes do |t|
      t.references :job_application, null: false, foreign_key: true
      t.integer :created_by_id
      t.text :content

      t.timestamps
    end
    add_foreign_key :notes, :users, column: :created_by_id
  end
end
