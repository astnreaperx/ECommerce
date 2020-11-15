# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
AdminUser.delete_all
ProductCategory.delete_all
ProductOrder.delete_all

Category.delete_all
Province.delete_all

Customer.delete_all

Order.delete_all
Product.delete_all
Woodworker.delete_all

# Generate 4 Categories
categories = ["Victorian", "Modern", "Vintage", "Traditional"]
description = ["1", "2", "3", "4"]
4.times do |c|
  Category.create(
    name:        categories[c],
    description: description[c]
  )
end

# Generate 10 WoodWorkers
20.times do |w|
  Woodworker.create(
    user_name:  Faker::Games::Witcher.character,
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    shop_name:  Faker::Space.moon,
    address:    Faker::Address.full_address
  )
end

# Generate 100 Products with woodworker and categories
100.times do |p|
  prod = Product.create(
    name:          "teasdasd",
    description:   "st",
    price:         10,
    delivery_cost: 10,
    woodworker:    Woodworker.order("RANDOM()").first,
    categories:    Category.order("RANDOM()").first(2)
  )
  puts prod.errors.messages
end

guy = Woodworker.create!(
  user_name:  "Test",
  first_name: "Test",
  last_name:  "Test",
  shop_name:  "Test",
  address:    "Test"
)

pro2 = guy.products.create!

pro2.categories.create!(
  name:        "Test",
  description: "Test"
)

puts "Product: #{Product.count}"
puts "Woodworkers: #{Woodworker.count}"
puts "Categories: #{Category.count}"
puts "Product Categories: #{ProductCategory.count}"
puts "Product Orders: #{ProductOrder.count}"
if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end
