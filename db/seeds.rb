# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Category.create(:title => "Meals")
Category.create(:title => "Electronic Devices")
Category.create(:title => "Mobile Phones")
Category.create(:title => "Home Appliances")
Category.create(:title => "Grocery")

# PRODUCT
Product.destroy_all
product1 = Product.create({:title=>"Tomato", :description=> "xyz", :price => 10})
product2 = Product.create({:title=>"Milk", :description=> "xyz", :price => 3})
product3 = Product.create({:title=>"Bread", :description=> "xyz", :price => 5.50})
product4 = Product.create({:title=>"Apple Tablet", :description=> "xyz", :price => 10})
product5 = Product.create({:title=>"Cheese", :description=> "xyz", :price => 3.20})
product6 = Product.create({:title=>"Huawei Honor 8x", :description=> "xyz", :price => 30000})



# Create associations b/w products and categories
CatsProdsAssociation.destroy_all

CatsProdsAssociation.create(category_id: 1, product_id: 1)
CatsProdsAssociation.create(category_id: 5, product_id: 1)

CatsProdsAssociation.create(category_id: 1, product_id: 2)

CatsProdsAssociation.create(category_id: 1, product_id: 3)
CatsProdsAssociation.create(category_id: 5, product_id: 3)

CatsProdsAssociation.create(category_id: 3, product_id: 4)

CatsProdsAssociation.create(category_id: 1, product_id: 5)

CatsProdsAssociation.create(category_id: 1, product_id: 6)
CatsProdsAssociation.create(category_id: 2, product_id: 6)

# Another way
# product6.categories<<Category.where(id: 1..2)

# CART
Cart.destroy_all
puts "\nTotal cart count: #{Cart.all.count}"
