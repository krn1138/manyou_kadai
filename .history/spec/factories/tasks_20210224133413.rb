FactoryBot.define do
    factory :task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'test_name' }
      note { 'test_note' }
    end

    factory :tasktwo,class: Task do
        # 下記の内容は実際に作成するカラム名に合わせて変更してください
        name { 'test_name' }
        note { 'test_note' }
    end

    factory :taskthree,class: Task do
        # 下記の内容は実際に作成するカラム名に合わせて変更してください
        name { 'test_name' }
        note { 'test_note' }
    end

    factory :taskfour,class: Task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'test_name4' }
      note { 'test_note4' }
    end

    factory :taskfive,class: Task do
      # 下記の内容は実際に作成するカラム名に合わせて変更してください
      name { 'test_name5' }
      note { 'test_note5' }
    end
  end