# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'date'

OrderItem.destroy_all
Order.destroy_all
Item.destroy_all
Restaurant.destroy_all
User.destroy_all
# --user--

10.times do

User.create(
  name: Faker::Name.name,
  address: Faker::Address.full_address,
  phone: Faker::PhoneNumber.cell_phone,
  email: Faker::Internet.email,
  password: "password123",
  is_seller: false
)

# puts "#{user.name} created..."
rand(0..2).times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    location: Faker::Address.street_name,
    category: Faker::Food.ethnic_category,
    opening_hour: rand(6..9),
    closing_hour: rand(14..23),
    user_id: rand(1..10)
  )

  # puts "#{restaurant.name} created for #{user.name}"
  Order.create(
    delivered: false,
    delivery_date: DateTime.now + rand(10),
    total_cost: Faker::Number.decimal,
    user_id: rand(1..10)
  )

rand(10).times do
  # puts "Item and Order created"
  item = Item.create(
      name: Faker::Food.dish,
      price: Faker::Number.decimal,
      description: Faker::Food.description,
      restaurant_id: rand(1..10)
  )

  OrderItem.create(
    quantity: Faker::Number.decimal_part,
    item: item,
    item_id: rand(1..10),
    order_id: rand(1..10)
  )
end
end
end


# puts "Seeding completed!"
# --------------------------------

#--restaurants--

# t.string "name"
# t.string "category"
# t.string "location"
# t.integer "opening_hour"
# t.integer "closing_hour"
# t.bigint "user_id", null: false

# -------------------------------

#--items--
# item = Item.create(
#   name: Faker::Food.dish,
#   price: Faker::Number.decimal,
#   description: Faker::Food.description,
#   restaurant:
# )

# # --order_items--

# order = Order.new(
#   delivered: false,
#   delivery_date: DateTime.now + rand(10),
#   total_cost: Faker::Number.decimal,
#   user:
# )

# order.save!

# OrderItem.create(
#   quantity: Faker::Number.decimal_part,
#   item:,
#   order:
# )
