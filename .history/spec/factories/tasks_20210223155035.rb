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

    factory :invalid_task,class: Task do
        # 下記の内容は実際に作成するカラム名に合わせて変更してください
        name { 'test_name' }
    end
end