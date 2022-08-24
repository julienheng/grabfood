# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'



# Restaurant.create(name: "Hong Kong Treasure", category: "Chinese", location: "Attleboro, MA", rating: 8)
# Restaurant.create(name: "Bagels & Cream", category: "American", location: "Singapore", rating: 10)

# Item.create(name: "Lox Cream Cheese", price: 8.5, description: "smoked salmon on bagel", category: "American")
# Item.create(name: "Fried Rice", price: 6.8, description: "chinese shit", category: "Chinese")
# Item.create(name: "Three Delights", price: 10, description: "stir fried stuff", category: "Chinese")
# Item.create(name: "Bacon Egg & Cheese", price: 5.5, description: "breakfast sandwich", category: "American")
# Item.create(name: "shit", price: 0, description: "free", category: "shit")

user = User.new(name:"Julian", password:"password123" ,address:"singapore", email:"dunaknaskfba@gmail.com", phone:"659879879987", is_seller: false)
user.save!
