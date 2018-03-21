# require 'csv'
# CSV.foreach(Rails.root.join("db/seeds_data/agencies.csv"), headers: true) do |row|
#   Agency.find_or_create_by(name: row[0], office_number: row[1], fax_number: row[2], street_name: row[3], postal_code: row[4], email: row[5], website: row[6], opening_hours: row[7], criteria: row[8], description: row[9])
# end

Admin.create!(name: "Admin", email: "admin@example.com", password: "123123")
puts "Default admin created!"

User.create!(name: "User1", username: "user1", password: "123123", postal_code: "650175", email: "user1@montfortcare.org.sg", birth_date: Date.new(1958, 6, 22))
User.create!(name: "User2", username: "user2", password: "123123", postal_code: "650175", email: "user2@montfortcare.org.sg", birth_date: Date.new(1978, 6, 22))
puts "2 users created!"

