# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'

Item.destroy_all
Restaurant.destroy_all
User.destroy_all

user = User.new(
  email: "sagags@asfas.com",
  password: "password123",
  name: "Hhahah",
  phone: "+65 1423t3626",
  address: "dsdahdshsfddsfhhd address",
  is_seller: true
)

user.save!
puts "#{user.name} created!"

restaurant = Restaurant.new(
  name: "ahaha shop",
  category: "Chinese Food",
  location: "Singapore",
  opening_hour: DateTime.now,
  closing_hour: DateTime.now,
  user:
)

file = URI.open("https://res.cloudinary.com/dvugbapyv/image/upload/v1661134008/cld-sample-4.jpg")
# file = URI.open("fish.jpg")
restaurant.photo.attach(io: file, filename: "fish.jpg", content_type: "image/jpg")
puts "#{restaurant.name} photo attached!"
restaurant.save!
puts "#{restaurant.name} created!"


item = Item.new(
  name: "item1",
  price: 100.00,
  description: "item1 desc",
  restaurant:
)

file = URI.open("https://res.cloudinary.com/dvugbapyv/image/upload/v1661325549/i0lkmnahere9nnp1p7ix.png")
# file = URI.open("fish.jpg")
item.photo.attach(io: file, filename: "fish.jpg", content_type: "image/jpg")
puts "#{item.name} photo attached!"
restaurant.save!
puts "#{item.name} created!"

item.save!

# t.string "name"
#     t.float "price"
#     t.text "description"
#     t.bigint "restaurant_id", null: false

# Restaurant.create(name: "Hong Kong Treasure", category: "Chinese", location: "Attleboro, MA", rating: 8)
# Restaurant.create(name: "Bagels & Cream", category: "American", location: "Singapore", rating: 10)

# Item.create(name: "Lox Cream Cheese", price: 8.5, description: "smoked salmon on bagel", category: "American")
# Item.create(name: "Fried Rice", price: 6.8, description: "chinese shit", category: "Chinese")
# Item.create(name: "Three Delights", price: 10, description: "stir fried stuff", category: "Chinese")
# Item.create(name: "Bacon Egg & Cheese", price: 5.5, description: "breakfast sandwich", category: "American")
# Item.create(name: "shit", price: 0, description: "free", category: "shit")
