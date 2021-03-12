FactoryBot.define do
    factory :task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'test_name1' }
      note { 'test_note1' }
      status { '未着手' }
      limit { DateTime.now }
      choice { '高'}
      association :user
    end

    factory :tasktwo,class: Task do
        # 下記の内容は実際に作成するカラム名に合わせて変更してください
        name { 'test_name2' }
        note { 'test_note2' }
        limit { DateTime.now }
        status { '着手中' }
        choice { '中' }
        association :user
    end

    factory :taskthree,class: Task do
        # 下記の内容は実際に作成するカラム名に合わせて変更してください
        name { 'test_name3' }
        note { 'test_note3' }
        limit { DateTime.now + 10 } 
        status { '完了' }
        choice { '低' }
        # association :user
    end

    
  end