# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ProductCategory.delete_all
ProductOrder.delete_all

Category.delete_all
Province.delete_all

Customer.delete_all

Order.delete_all
Product.delete_all
Woodworker.delete_all

cat = Category.create(
  name:        "Test",
  description: "Test"
)

guy = Woodworker.create(
  user_name:  "Test",
  first_name: "Test",
  last_name:  "Test",
  shop_name:  "Test",
  address:    "Test"
)

Woodworker.create(
  user_name:  "Test",
  first_name: "Test",
  last_name:  "Test",
  shop_name:  "Test",
  address:    "Test"
)

prod = Product.create(
  name:          "te",
  description:   "st",
  price:         10,
  delivery_cost: 10
)


pro2 = guy.products.create(
  name:          "teasdasd",
  description:   "st",
  price:         10,
  delivery_cost: 10
)

prod = guy.products.create(
  name:          "te",
  description:   "st",
  price:         10,
  delivery_cost: 10
)
puts prod.name
puts pro2.name

puts Product.count
puts Woodworker.count
puts Category.count
