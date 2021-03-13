# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(
#    email: 'karen0617@test.com',
#    name: 'karen',
#    password: 'password', 
#    password_confirmation: 'password'
# )

10.times do |n|
   User.create!(
     email: "test#{n + 1}@test.com",
     name: "テスト太郎#{n + 1}",
     password: "password#{n + 1}", 
   　password_confirmation: "password#{n + 1}"
   )
end

10.times do |i|
   Label.create!(title: "sample#{i + 1}")
end

10.times do |f|
   Task.create!(
     name: "test#{f + 1}@test.com",
     note: "テスト太郎#{f + 1}",
     status: "未着手", 
   　limit: DateTime.now.strftime("%F")
     choice: "高"
   )
end