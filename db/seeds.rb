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
Category.delete_all

Order.delete_all
Product.delete_all
Woodworker.delete_all
Owner.delete_all
ProductOrder.delete_all

Customer.delete_all
Province.delete_all


if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end

Owner.create(
  website_name: "Pine and Soul",
  owner_name: "Jerry Smith",
  website_description: "We are new here to the digital woodworking game, but we have high hopes and a high ambition to change that. Woodworking is one of those industries that has been around forever and the business model has not changed. That is where we come in, we want to change the traditional model to a semi-traditional model. We still strive for that traditional quality but are delivered in a streamlined, efficient, and convenient way. The traditional method tends to be slow and very expensive, our model will hope to eliminate the downsides of the traditional model."
)
Province.create(
  name:    "Alberta" ,
  location: "Canada",
  gst: 0.00,
  pst: 0.05,
  hst: 0.00
)
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

100.times do |p|
  furniture = Faker::House.furniture
  prod = Product.create(
    name:          Faker::Space.moon + "-" + furniture,
    description:   Faker::Lorem.paragraph,
    price:         Faker::Number.decimal(l_digits: 3, r_digits: 2),
    delivery_cost: Faker::Number.decimal(l_digits: 2, r_digits: 2),
    woodworker:    Woodworker.order("RANDOM()").first,
    categories:    Category.order("RANDOM()").first(2)
  )
  puts prod.errors.messages
  download_image = open(URI.open("https://source.unsplash.com/400x400/?" + Faker::House.furniture))
  prod.image.attach(io: download_image, filename: "IMG#{prod.id}.jpg")
end

Province.create(
  name:    "Alberta" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "British Columbia" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)
Province.create(
  name:    "Manitoba" ,
  location: "Canada",
  tax_rate: 0.7
)



puts "Woodworkers: #{Woodworker.count}"
puts "Customers: #{Customer.count}"

puts "Categories: #{Category.count}"
puts "Product: #{Product.count}"

puts "Product Categories: #{ProductCategory.count}"
puts "Product Orders: #{ProductOrder.count}"
