puts "Cleaning database..."

Restaurant.destroy_all
User.destroy_all
Comment.destroy_all

puts "Creating records..."

2.times do
  User.create!(
    email: Faker::Internet.free_email,
    password: "123123"
  )  
end


3.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    user: User.first
  )
end

restaurants = Restaurant.all

restaurants.each do |restaurant|
  Comment.create!(
    content: Faker::Restaurant.review,
    user: User.second,
    restaurant: restaurant
  )
end

puts "Done!"
