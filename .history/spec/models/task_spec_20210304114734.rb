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

  it 'scopeメソッドでタイトルのあいまい検索ができる' do

#     describe "scope" do
#       describe "with_title" do
#         let!(:applicable_article) { create(:task, name: tast_name1) }
#         subject { task.open }
#     it { is_expected.to include applecable_article }
#   end
# end
# end

    describe "scope" do
      describe "with_title" do
binding.irb
      let!(:task) { create(:task) } 
      let!(:tasktwo) { create(:tasktwo) } 

      subject { Task."name Like ?" }
      it { is_expected.to include task }

    end
  end

  #   describe "scope" do
  #     describe "with_title" do

  #   let! = task
  #   let! = tasktwo

  # result = Task.new<with_title(test_name1)>
  # expect(result).to eq task
  # expect(result).not_to eq tasktwo
  #   end
  # end
 end