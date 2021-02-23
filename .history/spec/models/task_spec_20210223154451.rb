require 'rails_helper'

RSpec.describe Task, type: :model do
  it '入力欄が全て入力された場合、問題なく投稿できる' do
    task = Task.new(
      name: 'test_task',
      note: 'test_task_note'
    )
    expect(task).to be_valid
  end

  it 'バリデーションが問題なく動く' do
    task = Task.new(
      name: 'test_task'
    )
    expect(task).to be_invalid
  end
end
