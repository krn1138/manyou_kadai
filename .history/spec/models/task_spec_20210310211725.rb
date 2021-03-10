require 'rails_helper'

RSpec.describe Task, type: :model do
  it '入力欄が全て入力された場合、問題なく投稿できる' do
    task = FactoryBot.create(:tasktwo)
    expect(task).to be_valid
  end

  it 'noteのバリデーションが問題なく動く' do
    task = Task.new(
      name: 'test_task'
    )
    expect(task).to be_invalid
  end

  it 'nameのバリデーションが問題なく動く' do
    task = Task.new(
      note: 'test_note'
    )
    expect(task).to be_invalid
  end

  describe '各種scopeメソッドのテスト' do
    before do
      FactoryBot.create(:task)
      FactoryBot.create(:tasktwo)
      FactoryBot.create(:taskthree)
      FactoryBot.create(:taskthree)
    end

    it 'タイトル検索' do
      # binding.irb
      expect(Task.with_title('test_name').count).to eq 7
      expect(Task.with_title('タスク').count).to eq 0
      expect(Task.with_title('test_name2').count).to eq 2

    end

    it 'ステータス検索' do
      expect(Task.with_choice('未着手').count).to eq 2
      expect(Task.with_choice('着手中').count).to eq 2
      expect(Task.with_choice('完了').count).to eq 3
    end

    it 'あいまい検索かつ、ステータス検索' do
      result = Task.with_title('test_name2')
      expect(result.with_choice('着手中').count).to eq 2
    end

  end
end


