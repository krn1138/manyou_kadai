FactoryBot.define do
    factory :task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'test_name1' }
      note { 'test_note1' }
      status { '未着手' }
      limit { DateTime.now }
      
    end

    factory :tasktwo,class: Task do
        # 下記の内容は実際に作成するカラム名に合わせて変更してください
        name { 'test_name2' }
        note { 'test_note2' }
        limit { DateTime.now }
        status { '着手中' }
    end

    factory :taskthree,class: Task do
        # 下記の内容は実際に作成するカラム名に合わせて変更してください
        name { 'test_name3' }
        note { 'test_note3' }
        limit { DateTime.now } 
        status { '完了' }
    end

    factory :taskfour,class: Task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'test_name4' }
      note { 'test_note4' }
      # limit { 'DateTime'}
    end

    factory :taskfive,class: Task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'test_name5' }
      note { 'test_note5' }
      # limit { 'DateTime'}
    end

    factory :task_sort,class: Task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'test_name5' }
      note { 'test_note5' }
      # limit { 'DateTime'}
    end

    factory :task_sarch,class: Task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'タスク' }
      note { 'test_note5' }
    end

    factory :task_status,class: Task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      status { '着手中' }
    end

  end