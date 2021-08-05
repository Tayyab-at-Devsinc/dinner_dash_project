# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
CatsProdsAssociation.destroy_all
Product.destroy_all
Cart.destroy_all
Order.destroy_all

Category.create(:title => "Breakfast")
Category.create(:title => "Casual Dining")
Category.create(:title => "Fast Food")
Category.create(:title => "Buffet")
Category.create(:title => "Ghar ka khana")


# PRODUCT
size=20
Products = Array.new(size)
Titles = ["Egg McMuffin","Bread","Cheese","Milk", "CHILLI CRAB","CURRY FEAST","Roti Paratha", "BEEF RENDANG","BEEF NOODLES","Biryani","Nihari","Kabuli Pulao","Karahi", "Haleem","Mutton Korma","Tikka Kebab","Sajji", "Whopper","Cheeseburger","Pizza",]
Descriptions = ["xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz","xyz",]
Prices = [300,1300,500,200,100,50,600,800,1000,2000,500,300,300,200,100,150,120,2000,100,250,]

i=0
while i<size do
  Products[i] = Product.new(:title => Titles[i], :description => Descriptions[i], :price => Prices[i])
  i= i+1
end

# Create associations b/w products and categories
Products[0].categories<<Category.find(1)
Products[0].categories<<Category.find(3)
Products[1].categories<<Category.find(1)
Products[2].categories<<Category.find(1)
Products[3].categories<<Category.find(2)
Products[4].categories<<Category.find(2)
Products[5].categories<<Category.find(2)
Products[6].categories<<Category.find(2)
Products[7].categories<<Category.find(2)
Products[8].categories<<Category.find(2)
Products[9].categories<<Category.find(3)
Products[10].categories<<Category.find(3)
Products[11].categories<<Category.find(3)
Products[12].categories<<Category.find(3)
Products[13].categories<<Category.find(3)
Products[14].categories<<Category.find(4)
Products[15].categories<<Category.find(5)
Products[16].categories<<Category.find(5)
Products[17].categories<<Category.find(5)
Products[18].categories<<Category.find(5)
Products[19].categories<<Category.find(5)

Products.each do |p|
  p.save # to save cats
end

# Add images to products
ImageNames = ['egg_mcmuffin', 'bread', 'cheese', 'milk', 'chilli_crab', 'curry_feast', 'roti_paratha', 'beef_redeng', 'beef_noodles', 'biryani', 'nihari', 'kabuli_pulao', 'karahi', 'haleem', 'mutton_korma', 'tikka_kebab', 'sajji', 'whopper', 'cheeseburger', 'pizza']
i=0
while i<size do
  Products[i].image.attach(io: File.open("app/assets/images/products/#{ImageNames[i]}.jpg"), filename: 'Image')
  i= i+1
end



user1 = User.create(email: 'demo+rachel@jumpstartlab.com', password: 'password', full_name: 'Rachel Warbelow')
user2 = User.create(email: 'demo+jeff@jumpstartlab.com', password: 'password', full_name: 'Jeff Casimir', display_name: 'j3')
user3 = User.create(email: 'demo+jorge@jumpstartlab.com', password: 'password', full_name: 'Jorge Tellez', display_name: 'novohispano')
admin1 = User.create(email: 'demo+josh@jumpstartlab.com', password: 'password', full_name: 'Josh Cheek', display_name: 'josh', admin:true)
admin2 = User.create(email: 'tayyabejaz668@gmail.com', password: '123456', full_name: 'Tayyab Ejaz', display_name: 'Tayyab', admin:true)

Orders = Array.new(10)
Orders[0] = Order.new(user_id: user1.id, order_status: "placed", total_price: 12123)
OrderItem.create(order_id: Orders[0].id, product_id: Products[0].id, quantity: 2)
Orders[0].save

Orders[1] = Order.new(user_id: user1.id, order_status: "placed", total_price: 445)
OrderItem.create(order_id: Orders[1].id, product_id: Products[3].id, quantity: 1)
Orders[1].save

Orders[2] = Order.new(user_id: user2.id, order_status: "completed", total_price: 5456)
OrderItem.create(order_id: Orders[2].id, product_id: Products[5].id, quantity: 1)
Orders[2].save

Orders[3] = Order.new(user_id: user2.id, order_status: "completed", total_price: 445)
OrderItem.create(order_id: Orders[3].id, product_id: Products[1].id, quantity: 1)
Orders[3].save


Orders[4] = Order.new(user_id: user3.id, order_status: "cancelled", total_price: 4545)
OrderItem.create(order_id: Orders[4].id, product_id: Products[19].id, quantity: 1)
Orders[4].save

Orders[5] = Order.new(user_id: user3.id, order_status: "cancelled", total_price: 51)
OrderItem.create(order_id: Orders[5].id, product_id: Products[18].id, quantity: 1)
Orders[5].save


Orders[6] = Order.new(user_id: user3.id, order_status: "placed", total_price: 510)
OrderItem.create(order_id: Orders[6].id, product_id: Products[15].id, quantity: 1)
Orders[6].save
