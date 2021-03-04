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
      expect(Task.with_title('test_name2').count).to eq 1
    end

    it 'ステータス検索' do
      expect(Task.with_choice('未着手').count).to eq 1
      expect(Task.with_choice('着手中').count).to eq 1
      expect(Task.with_choice('完了').count).to eq 2

      binding.irb
    end

  end
end



  
#         let!(:with_title) { create(:task, name: tast_name1) }
#         subject { task.open }
#     it { is_expected.to include with_title }
#   end
# end
# end

#     describe "scope" do
#       describe "with_title" do
# binding.irb
#       let!(:task) { create(:task) } 
#       let!(:tasktwo) { create(:tasktwo) } 

#       subject { Task "name Like ?" }
#       it { is_expected.to include task }

#     end
#   end

#   #   describe "scope" do
#   #     describe "with_title" do

#   #   let! = task
#   #   let! = tasktwo

#   # result = Task.new<with_title(test_name1)>
#   # expect(result).to eq task
#   # expect(result).not_to eq tasktwo
#   #   end
#   # end
#  end

# describe 'タスクモデル機能', type: :model do
#   describe '検索機能' do
#     # 必要に応じて、テストデータの内容を変更して構わない
#     let!(:task) { FactoryBot.create }
#     let!(:task_two) { FactoryBot.create }
#     context 'scopeメソッドでタイトルのあいまい検索をした場合' do
#       it "検索キーワードを含むタスクが絞り込まれる" do
#         # title_seachはscopeで提示したタイトル検索用メソッドである。メソッド名は任意で構わない。
#         expect(Task.with_title('task')).to include(test_name1)
#         expect(Task.with_title('task')).not_to include(test_name2)
#         expect(Task.with_title('task').count).to eq 1
#       end
#     end
#     context 'scopeメソッドでステータス検索をした場合' do
#       it "ステータスに完全一致するタスクが絞り込まれる" do
        
#       end
#     end
#     context 'scopeメソッドでタイトルのあいまい検索とステータス検索をした場合' do
#       it "検索キーワードをタイトルに含み、かつステータスに完全一致するタスク絞り込まれる" do
#         # ここに内容を記載する
#       end
#     end
#   end
# end