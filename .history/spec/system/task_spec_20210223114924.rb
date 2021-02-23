require 'rails_helper'
describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        # テストで使用するためのタスクを作成
        task = FactoryBot.create(:task)
        # タスク一覧ページに遷移
        visit tasks_path
        # visitした（遷移した）page（タスク一覧ページ）に「task」という文字列が
        # have_contentされているか（含まれているか）ということをexpectする（確認・期待する）
        expect(page).to have_content 'test_note'
        # expectの結果が true ならテスト成功、false なら失敗として結果が出力される
      end
    end
  end
end

# RSpec.describe 'タスク管理機能', type: :system do
      describe '新規作成機能' do
        context 'タスクを新規作成した場合' do
          it '作成したタスクが表示される' do
            task = FactoryBot.create(:tasktwo)
            visit tasks_path
            click_on 'New Task'
            fill_in 'task[name]', with: 'kkk'
            # expect(page).to have_content 'test_name'
            fill_in 'task[note]', with: 'あけましておめでとうございます。'
            click_button 'submit'
            # expect(page).to have_content 'test_note'
            expect(page).to have_field 'note', with: 'あけましておめでとうございます。'
            expect(page).to have_field 'name', with: 'kkk'
      end
   end
 end

      describe '詳細表示機能' do
        context '任意のタスク詳細画面に遷移した場合' do
          it '該当タスクの内容が表示される' do
            task = FactoryBot.create(:task)
            visit tasks_path
            click_on "tasks-index_task-#{task.id}-show"
            # expect(page).to have_content 'test_name'
            expect(page).to have_field 'note', with: 'あけましておめでとうございます。'
            expect(page).to have_field 'name', with: 'kkk。'
        end
    end
 end

# require 'rails_helper'
# RSpec.describe 'タスク管理機能', type: :system do
#   describe '新規作成機能' do
#     context 'タスクを新規作成した場合' do
#       it '作成したタスクが表示される' do
#       end
#     end
#   end
#   describe '一覧表示機能' do
#     context '一覧画面に遷移した場合' do
#       it '作成済みのタスク一覧が表示される' do
#       end
#     end
#   end
#   describe '詳細表示機能' do
#      context '任意のタスク詳細画面に遷移した場合' do
#        it '該当タスクの内容が表示される' do
#        end
#      end
#   end
# end