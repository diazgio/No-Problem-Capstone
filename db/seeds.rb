# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |_i|
  User.create!(name: Faker::Name.name,
               username: Faker::Name.unique.first_name,
               email: Faker::Internet.unique.email,
               password: 'password',
               password_confirmation: 'password')
end

Following.create(follower_id: 1, followed_id:10)
Following.create(follower_id: 4, followed_id:3)
Following.create(follower_id: 2, followed_id:7)
Following.create(follower_id: 6, followed_id:4)

Category.create(category: 'Ruby on Rails')