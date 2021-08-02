# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Category.create(:title => "Meals")

# PRODUCT
Product.destroy_all
product1 = Product.create({:title=>"tomato", :description=> "xyz", :price => 1, :category_id=>1})
product2 = Product.create({:title=>"milk", :description=> "xyz", :price => 3, :category_id=>1})
product3 = Product.create({:title=>"bread", :description=> "xyz", :price => 5.50, :category_id=>1})
product4 = Product.create({:title=>"bacon", :description=> "xyz", :price => 10, :category_id=>1})
product5 = Product.create({:title=>"cheese", :description=> "xyz", :price => 3.20, :category_id=>1})


puts "Total number of products: #{Product.all.count}"
puts "Product names: #{Product.all.pluck("title")}"
puts "Product1: #{product1.title} price: #{product1.price.round(2)}"
puts "Product2: #{product2.title} price: #{product2.price.round(2)}"
puts "Product3: #{product3.title} price: #{product3.price.round(2)}"
puts "Product4: #{product4.title} price: #{product4.price.round(2)}"
puts "Product5: #{product5.title} price: #{product5.price.round(2)}"

# CART
Cart.destroy_all
puts "\nTotal cart count: #{Cart.all.count}"
