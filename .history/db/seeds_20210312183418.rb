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


# Userのdataが一見でもある場合,最後に作成されたUserの続きのID番号からUserを作成しないといけない.
if User.count != 0
   user = User.last
   next_id = user.id + 1
else
   next_id = 1
end

10.times do
   User.create!(
     email: "test#{next_id}@test.com",
     name: "テスト太郎#{next_id}",
     password: "password#{next_id}", 
   )
   next_id += 1
end

10.times do |i|
   Label.create!(title: "sample#{i + 1}")
end

user_amount = User.count
10.times do |f|
   # user = User.find(rand(1..user_amount))

   Task.create!(
     name: "テストタスク#{f + 1}",
     note: "テストタスクnote#{f + 1}",
     status: rand(1..3), 
     limit: DateTime.now.strftime("%F"),
     choice: rand(1..3),
     user_id: rand(1..user_amount)
   )
end

task_amount = Task.count
label_amount = Label.count
10.times do |t|
   TaskLabel.create!(
      task_id: rand(1..task_amount),
      label_id: rand(1..label_amount)
   )
end