# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Seeding jobs..."

admin = User.find_by(email: "admin@company.com")
candidate = User.find_by(email: "candidate@company.com")

User.find_or_create_by!(email: "admin@company.com") do |u|
  u.password = "password"
  u.role = :admin
  u.first_name = "Admin"
  u.last_name = "User"
end

User.find_or_create_by!(email: "staff@company.com") do |u|
  u.password = "password"
  u.role = :staff
  u.first_name = "Staff"
  u.last_name = "User"
end

User.find_or_create_by!(email: "candidate@company.com") do |u|
  u.password = "password"
  u.role = :candidate
  u.first_name = "Candidate"
  u.last_name = "User"
end

job = Job.find_or_create_by!(title: "Software Engineer") do |j|
  j.description = "Build cool stuff"
  j.location = "Bangalore"
  j.status = :open
  j.created_by = admin
end

JobApplication.find_or_create_by!(candidate: candidate, job: job) do |a|
  a.status = :applied
end