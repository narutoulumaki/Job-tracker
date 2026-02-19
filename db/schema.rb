# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_02_19_094807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "job_applications", force: :cascade do |t|
    t.integer "candidate_id", null: false
    t.text "cover_letter"
    t.datetime "created_at", null: false
    t.bigint "job_id", null: false
    t.string "resume"
    t.integer "status", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id", "job_id"], name: "index_job_applications_on_candidate_id_and_job_id", unique: true
    t.index ["job_id"], name: "index_job_applications_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "created_by_id", null: false
    t.text "description"
    t.string "job_code"
    t.string "location"
    t.integer "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["job_code"], name: "index_jobs_on_job_code", unique: true
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.integer "created_by_id"
    t.bigint "job_application_id", null: false
    t.datetime "updated_at", null: false
    t.index ["job_application_id"], name: "index_notes_on_job_application_id"
  end

  create_table "reminders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "is_sent", default: false
    t.bigint "job_application_id", null: false
    t.string "message"
    t.datetime "remind_at"
    t.datetime "updated_at", null: false
    t.index ["job_application_id"], name: "index_reminders_on_job_application_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "address"
    t.datetime "created_at", null: false
    t.date "dob"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role", default: 2, null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "job_applications", "jobs"
  add_foreign_key "job_applications", "users", column: "candidate_id"
  add_foreign_key "jobs", "users", column: "created_by_id"
  add_foreign_key "notes", "job_applications"
  add_foreign_key "notes", "users", column: "created_by_id"
  add_foreign_key "reminders", "job_applications"
end
