require 'csv'
CSV.foreach(Rails.root.join("db/seeds_data/agencies.csv"), headers: true) do |row|
  Agency.find_or_create_by!(name: row[0], street_name: row[1], postal_code: row[2], office_number: row[3], fax_number: row[4],  email: row[5], website: row[6], opening_hours: row[7], criteria: row[8], description: row[9], area: row[13])
end

puts "Agency created"

CSV.foreach(Rails.root.join("db/seeds_data/categories.csv"), headers: true) do |row|
  Category.find_or_create_by!(name: row[0])
end

puts "Category created"

CSV.foreach(Rails.root.join("db/seeds_data/users.csv"), headers: true) do |row|
  User.create!(email: row[0], password: row[1], username: row[2], name: row[3], postal_code: row[4], role: row[5], agency_id: row[6], visit_id: row[7])
end

puts "Agency users created"

Admin.create!(name: "Admin", email: "admin@example.com", password: "123123")
puts "Default admin created"

User.create!(name: "User1", username: "user1", password: "123123", postal_code: "650175", email: "user1@montfortcare.org.sg", birth_date: Date.new(1958, 6, 22), role: "user")
User.create!(name: "User2", username: "user2", password: "123123", postal_code: "650175", email: "user2@montfortcare.org.sg", birth_date: Date.new(1978, 6, 22), role: "user")
User.create!(name: "User3", username: "user3", password: "123123", postal_code: "650175", email: "user3@montfortcare.org.sg", birth_date: Date.new(1958, 6, 22), role: "user")
User.create!(name: "User4", username: "user4", password: "123123", postal_code: "650175", email: "user4@montfortcare.org.sg", birth_date: Date.new(1978, 6, 22), role: "user")
puts "4 users created"

(1..49).each do |x|
  Agency.find(x).category_ids = [2,13,17]
end

(50..73).each do |x|
  Agency.find(x).category_ids = [1,9]
end

(74..84).each do |x|
  Agency.find(x).category_ids = [9,10,12]
end

(85..105).each do |x|
  Agency.find(x).category_ids = [3]
end

Agency.find(106).category_ids = [2,7,8]
Agency.find(107).category_ids = [6,17]
Agency.find(108).category_ids = [2,5,6,11]
Agency.find(109).category_ids = [2,7,8,12,13,17]

puts "Agency and Category associated"
