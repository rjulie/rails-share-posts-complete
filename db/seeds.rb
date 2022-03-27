require 'faker'

# Destroying data
puts "Destroying posts..."
Post.destroy_all
puts "Destroying comments..."
Comment.destroy_all
puts "Destroying users..."
User.destroy_all
puts "Destroying tags..."
Tag.destroy_all

# Creating users
puts "Creating users..."
emails = ["julie@gmail.com", "thomas@gmail.com", "gala@gmail.com", "lucien@gmail.com", "carole@gmail.com"]
passwords = ["adminj", "admint", "adming", "adminl", "adminc"]
nicknames = ["julier", "thomasl", "galat", "lucienl", "carolec"]

user_index = 0
5.times do
  User.create!(
    email: emails[user_index],
    password: passwords[user_index],
    nickname: nicknames[user_index],
  )
  user_index += 1
end
puts "Users creation done!"

# Creating Posts
puts "Creating Posts"
10.times do
  Post.create!(
    title: Faker::Hacker.adjective,
    content: Faker::Hacker.say_something_smart,
    url: Faker::Internet.url,
    user: User.all.sample
  )
end
puts "Posts creation done!"

# Creating Comments
puts "Creating Comments"
20.times do
  Comment.create!(
    content: Faker::Marketing.buzzwords,
    user: User.all.sample,
    post: Post.all.sample
  )
end
puts "Comments creation done!"

# Creating Tags
puts "Creating Tags"
categories = ["Rails", "Javascript", "Python", "Flutter", "React"]
tag_index = 0
5.times do
  Tag.create!(
    category: categories[tag_index],
    post: Post.all.sample
  )
  tag_index += 1
end
puts "Tags creation done!"
