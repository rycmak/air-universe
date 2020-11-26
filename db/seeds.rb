# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Booking.destroy_all
Galaxy.destroy_all
User.destroy_all

sy = User.create(email: "test@test.com", password: "password", first_name: "Sy", last_name: "Rashid")
andromeda = Galaxy.create(name: "Andromeda", description: "Very close", rate: 9999, owner: sy)
booking_sy = Booking.create(customer: sy, start_date: Time.now, end_date: (Time.now + 5000), galaxy: andromeda)

# Create 10 more users/galaxies/bookings

puts "Creating users..."
10.times do 
  user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")  
end
puts "Done creating users"

puts "Creating galaxies..."
10.times do
  galaxy = Galaxy.create(name: Faker::Space.galaxy, description: Faker::Lorem.paragraphs, rate: rand(500), owner: User.all.sample)
end
puts "Done creating galaxies"

puts "Creating bookings..."
10.times do
  booking = Booking.create(customer: User.all.sample, start_date: Time.now, end_date: (Time.now + rand(500_000)), galaxy: Galaxy.all.sample)
end
puts "Done creating bookings"

puts "Creating reviews..."
20.times do
  review = Review.create(booking: Booking.all.sample, rating: rand(1..5), description: Faker::Quote.yoda )
end
puts "Done creating reviews"
