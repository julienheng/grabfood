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

puts "Creating 10 sellers..."
user1 = User.create!(
  name: "Delvin",
  address: "23 Bukit Panjang",
  phone: "781646738",
  email: "delvin44@email.com",
  password: "password123",
  is_seller: true
)

puts "  Creating restaurants for Seller..."
restaurant = Restaurant.create!(
  name: "Melting Pot",
  location: "57 West Main Street, Boston MA, 02703",
  category: "Fusion",
  opening_hour: 6,
  closing_hour: 4,
  user: user1
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661753360/bagelshop_n4oxmg.jpg")
restaurant.photo.attach(io: file, filename: "bagelshop.jpg", content_type: "image/jpg")
puts "#{restaurant.name} photo attached!"
restaurant.save!
puts "#{restaurant.name} created!"

restaurant1 = Restaurant.create!(
  name: "Bento Kento",
  location: "Tokyo",
  category: "Japanese",
  opening_hour: 8,
  closing_hour: 8,
  user: user1
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661757534/japres_fmvrba.jpg")
restaurant1.photo.attach(io: file, filename: "japanese.jpg", content_type: "image/jpg")
puts "#{restaurant1.name} photo attached!"
restaurant1.save!
puts "#{restaurant1.name} created!"

restaurant2 = Restaurant.create!(
  name: "Petit Canard",
  location: "Bordeaux",
  category: "French",
  opening_hour: 8,
  closing_hour: 8,
  user: user1
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661757698/frenchres_ya8qyn.jpg")
restaurant2.photo.attach(io: file, filename: "french.jpg", content_type: "image/jpg")
puts "#{restaurant2.name} photo attached!"
restaurant2.save!
puts "#{restaurant2.name} created!"

puts "Creating items for restaurant...\n\n"

item = Item.create!(
  name: "Lox Sandwich",
  price: 9.5,
  description: "Smoked salmon on bagel",
  restaurant:
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661752478/IMG_7002_-_Copy_xgznta.jpg")
item.photo.attach(io: file, filename: "bagel.jpg", content_type: "image/jpg")
puts "#{item.name} photo attached!"
item.save!
puts "#{item.name} created!"

item1 = Item.create!(
  name: "Lobster Roll",
  price: 10.5,
  description: "Main Lobster",
  restaurant:
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661752685/lobster_roll_p1vmhb.jpg")
item1.photo.attach(io: file, filename: "lobster.jpg", content_type: "image/jpg")
puts "#{item1.name} photo attached!"
item1.save!
puts "#{item1.name} created!"

item2 = Item.create!(
  name: "Chicken Rice",
  price: 6.5,
  description: "Hainanese Chicken",
  restaurant:
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661752660/154660_xae6xr.jpg")
item2.photo.attach(io: file, filename: "chicken.jpg", content_type: "image/jpg")
puts "#{item2.name} photo attached!"
item2.save!
puts "#{item2.name} created!"

item3 = Item.create!(
  name: "BBQ Ribs",
  price: 12,
  description: "Best Texas bbq",
  restaurant:
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661756816/bbq_io4mzt.jpg")
item3.photo.attach(io: file, filename: "bbq.jpg", content_type: "image/jpg")
puts "#{item3.name} photo attached!"
item3.save!
puts "#{item3.name} created!"

item4 = Item.create!(
  name: "Ceviche",
  price: 11.75,
  description: "Peruvian seafood",
  restaurant:
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661756806/ceviche_u7w703.jpg")
item4.photo.attach(io: file, filename: "ceviche.jpg", content_type: "image/jpg")
puts "#{item4.name} photo attached!"
item4.save!
puts "#{item4.name} created!"

item5 = Item.create!(
  name: "Duck Confit",
  price: 15,
  description: "Roasted duck",
  restaurant: restaurant2
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661757536/duckconfit_w9hniq.jpg")
item5.photo.attach(io: file, filename: "duck.jpg", content_type: "image/jpg")
puts "#{item5.name} photo attached!"
item5.save!
puts "#{item5.name} created!"

item6 = Item.create!(
  name: "Ramen",
  price: 9,
  description: "Japanese noodle",
  restaurant: restaurant1
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661757532/ramen_lxhsgs.jpg")
item6.photo.attach(io: file, filename: "ramen.jpg", content_type: "image/jpg")
puts "#{item6.name} photo attached!"
item6.save!
puts "#{item6.name} created!"

item7 = Item.create!(
  name: "Sirloin Steak",
  price: 20,
  description: "sliced steak",
  restaurant: restaurant2
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661757515/frenchsteak_zffmxy.jpg")
item7.photo.attach(io: file, filename: "steak.jpg", content_type: "image/jpg")
puts "#{item7.name} photo attached!"
item7.save!
puts "#{item7.name} created!"

item8 = Item.create!(
  name: "Japanese bbq",
  price: 10,
  description: "grilled meat",
  restaurant: restaurant1
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661757530/skews_vqeugs.jpg")
item8.photo.attach(io: file, filename: "skews.jpg", content_type: "image/jpg")
puts "#{item8.name} photo attached!"
item8.save!
puts "#{item8.name} created!"


item9 = Item.create!(
  name: "Sashimi",
  price: 20,
  description: "Fresh sushi",
  restaurant: restaurant1
)

file = URI.open("https://res.cloudinary.com/julienheng/image/upload/v1661757513/sashimi_qwon9s.jpg")
item9.photo.attach(io: file, filename: "sushi.jpg", content_type: "image/jpg")
puts "#{item9.name} photo attached!"
item9.save!
puts "#{item9.name} created!"

puts "Creating non sellers..."
restaurants = Restaurant.all


  user = User.create!(
    name: "Julien",
    address: "24 Raymond Drive",
    phone: 7815354602,
    email: "julien8@email.com",
    password: "password123",
    is_seller: false
  )

  puts "  Creating orders for user..."
  # select a single restaurant for this order
  restaurant = restaurants.sample

  2.times do
    order = Order.create!(
      delivered: [true, false].sample,
      delivery_date: Date.today,
      total_cost: rand(100),
      user:
    )

    OrderItem.create!(
      quantity: 5,
      item: restaurant.items.sample,
      order:
    )
  end

puts "Seeding completed!"
