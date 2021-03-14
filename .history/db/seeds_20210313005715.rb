

# Userのdataが一見でもある場合,最後に作成されたUserの続きのID番号からUserを作成しないといけない.
if User.count != 0
  user = User.last
  next_id = user.id + 1
else
  next_id = 1
end
# -----------------------------------------------------
# elseになるということは, User.countの結果が0ということ
# つまり,Userはこれまで一度も作成されていないため,
# User.lastの結果がnilになる. 
#user.idを実行するとnilに対してidカラムを参照することになるためエラ-が発生する
# そのためここでnext_id変数に1を入れてstartの番号を決めている
# -----------------------------------------------------


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

# taskとuser, taskとlabelのassociationについては,
# 削除されたtaskやlabelがあるとrandメソッドの挙動で存在しないID番号が選ばれてしまう可能性がある
# これは今後のリファクタ対象
