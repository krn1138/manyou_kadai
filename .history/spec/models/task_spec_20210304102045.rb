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
end

RSpec.describe Task, type: :model do
  binding.irb
  describe "scope" do
    describe "with_title" do
      let!(:applicable_article) { create(:article, released_at: Date.today, expired_at: Date.today+1) }
    end
  end
 end