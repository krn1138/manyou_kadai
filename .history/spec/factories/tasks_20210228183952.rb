FactoryBot.define do
    factory :task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'test_name' }
      note { 'test_note' }
      # limit { 'DateTime'}
      
    end

    factory :tasktwo,class: Task do
        # 下記の内容は実際に作成するカラム名に合わせて変更してください
        name { 'test_name' }
        note { 'test_note' }
        limit { 'DateTime'}
    end

    factory :taskthree,class: Task do
        # 下記の内容は実際に作成するカラム名に合わせて変更してください
        name { 'test_name' }
        note { 'test_note' }
        limit { 'DateTime'}
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
      limit { 'DateTime'}
    end

    factory :task_sort,class: Task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'test_name5' }
      note { 'test_note5' }
      limit { 'DateTime'}
    end

    factory :task_sarch,class: Task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'タスク' }
    end

    factory :task_status,class: Task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      status { '着手中' }
    end

  end