# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'
require 'date'

puts "Clearing old data..."
OrderItem.destroy_all
Order.destroy_all
Item.destroy_all
Restaurant.destroy_all
User.destroy_all

# --user--

puts "Creating 3 sellers..."
3.times do |index|
  user = User.create!(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone,
    email: "seller#{index}@email.com",
    password: "password123",
    is_seller: true
  )

  puts "  Creating restaurants for Seller #{index}..."
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    location: Faker::Address.street_name,
    category: Faker::Food.ethnic_category,
    opening_hour: rand(6..9),
    closing_hour: rand(14..23),
    user:
  )

  file = URI.open("https://res.cloudinary.com/dvugbapyv/image/upload/v1661134008/cld-sample-4.jpg")
  # file = URI.open("fish.jpg")
  restaurant.photo.attach(io: file, filename: "fish.jpg", content_type: "image/jpg")
  puts "#{restaurant.name} photo attached!"
  restaurant.save!
  puts "#{restaurant.name} created!"

  puts "    Creating items for restaurant...\n\n"
  rand(2..5).times do
    item = Item.create!(
      name: Faker::Food.dish,
      price: Faker::Number.decimal,
      description: Faker::Food.description,
      restaurant:
      )
    file = URI.open("https://res.cloudinary.com/dvugbapyv/image/upload/v1661325549/i0lkmnahere9nnp1p7ix.png")
    # file = URI.open("fish.jpg")
    item.photo.attach(io: file, filename: "fish.jpg", content_type: "image/jpg")
    puts "#{item.name} photo attached!"
    restaurant.save!
    puts "#{item.name} created!"
  end
end

puts "Creating non sellers..."
restaurants = Restaurant.all

10.times do |index|
  user = User.create!(
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone,
    email: "user#{index}@email.com",
    password: "password123",
    is_seller: false
  )

  puts "  Creating orders for user..."
  # select a single restaurant for this order
  restaurant = restaurants.sample

  rand(1..3).times do
    order = Order.create!(
      delivered: [true, false].sample,
      delivery_date: Date.today,
      total_cost: rand(100),
      user: user
    )

    OrderItem.create!(
      quantity: rand(1..4),
      item: restaurant.items.sample,
      order: order
    )
  end
end

puts "Seeding completed!"
