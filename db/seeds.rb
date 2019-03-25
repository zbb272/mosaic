# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Post.delete_all
Tag.delete_all
PostsTag.delete_all

zach = User.create(username: "zbb272", first_name: "Zach", last_name: "Berman", bio: "Really amazing programmer extraordinarie")
ben = User.create(username: "bmnumbernumbernumber", first_name: "Ben", last_name: "Manekin", bio: "Just a cool dude")
sean = User.create(username: "duke", first_name: "Sean", last_name: "Lucius", bio: "gets mad ass ")
miguel = User.create(username: "minute", first_name: "Miguel", last_name: "Morales", bio: "I'll write this later")

post1 = Post.create(title: "Sticks", description: "here is a really good stick", img_url: "https://images.pexels.com/photos/2025839/pexels-photo-2025839.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", :user => zach)
post2 = Post.create(title: "Lady", description: "here is a sleeping lady", img_url: "https://images.pexels.com/photos/2032249/pexels-photo-2032249.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", :user => ben)
post3 = Post.create(title: "Leafs", description: "here is a leaves in milk", img_url: "https://images.pexels.com/photos/1405773/pexels-photo-1405773.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", :user => sean)
post4 = Post.create(title: "Window", description: "here is a window", img_url: "https://images.pexels.com/photos/1769408/pexels-photo-1769408.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", :user => miguel)
post5 = Post.create(title: "Fence", description: "here is a broken fence", img_url: "https://images.pexels.com/photos/1829190/pexels-photo-1829190.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", :user => zach)

nature = Tag.create(name: "Nature")
weather = Tag.create(name: "Weather")
portait = Tag.create(name: "Portait")
colorful = Tag.create(name: "Colorful")
vintage = Tag.create(name: "Vintage")

posts_tag1 = PostsTag.create(:post => post1, :tag => nature)
posts_tag2 = PostsTag.create(:post => post2, :tag => weather)
posts_tag3 = PostsTag.create(:post => post3, :tag => portait)
posts_tag4 = PostsTag.create(:post => post4, :tag => colorful)
posts_tag5 = PostsTag.create(:post => post5, :tag => vintage)
