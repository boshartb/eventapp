# puts "Flushing database"
# [User, Event, Engagement].map(&:destroy_all)

# puts "Creating users...."
# 500.times do
#   User.create!(
#     name: Faker::Name.name,
#     password: "password",
#     password_confirmation: "password" 
#   )
#   print "|"
# end

User.create!(
  name: "admin",
  password: "admin",
  password_confirmation: "admin",
  admin: true
)

puts "\nCreating rad categories...."
["Live Music",
  "DJ event", 
  "Art Event", 
  "Cultural", 
  "Social Event"].each do |category|
  Category.create!(name: category)
  print "|"
end


# puts "\nCreating rad events...."
# 100.times do
#   date = Date.today + (rand(30) + 1).days
#   Event.create!(
#     remote_image_url: Faker::Avatar.image,
#     start_date: date,
#     end_date: date + 1.days,
#     time: Time.now,
#     address: Faker::Address.street_address,
#     title: Faker::App.name,
#     description: Faker::Hacker.say_something_smart,
#     secret: [true, false].sample,
#     keep_after_event: [true, false].sample
#   )
#   print "|"
# end

# puts "\nCreating rad events...."
# 100.times do
#   Event.create!(
#     remote_image_url: Faker::Avatar.image,
#     start_date: Date.today,
#     end_date: Date.today - (rand(30) + 1).days,
#     time: Time.now,
#     address: Faker::Address.street_address,
#     title: Faker::App.name,
#     description: Faker::Hacker.say_something_smart,
#     secret: [true, false].sample,
#     keep_after_event: [true, false].sample,
#     category_id: Category.all.sample.id
#   )
#   print "|"
# end

# puts "\n Checking out dope parties, yo..."
# all_users = User.all
# all_events = Event.all
# 1500.times do
#   Engagement.create!(
#     user_id: all_users.sample.id,
#     event_id: all_events.sample.id,
#     secret: [true, false].sample
#   )
#   print "|"
# end
