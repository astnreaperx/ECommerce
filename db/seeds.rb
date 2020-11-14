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
Woodworker.delete_all

Order.delete_all
Product.delete_all


Category.create(
    
)