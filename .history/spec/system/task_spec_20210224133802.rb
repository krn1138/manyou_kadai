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

      describe '新規作成機能' do
        context 'タスクを新規作成した場合' do
          it '作成したタスクが表示される' do
            task = FactoryBot.build(:tasktwo)
            visit tasks_path
            click_on 'New Task'
            fill_in 'task[name]', with: task.name
            fill_in 'task[note]', with: task.note
            click_button 'tasks-form_submit'
            created = Task.last
            expect(
                find_by_id("tasks-index_task-#{created.id}-note")
            ).to have_content task.note
            
            expect(
                find_by_id("tasks-index_task-#{created.id}-name")
            ).to have_content task.name
      end
   end
 end

      describe '詳細表示機能' do
        context '任意のタスク詳細画面に遷移した場合' do
          it '該当タスクの内容が表示される' do
            task = FactoryBot.create(:task)
            visit tasks_path
            click_on "tasks-index_task-#{task.id}-show"
            expect(
                find_by_id("tasks-show_task-note")
            ).to have_content task.note

            expect(
                find_by_id("tasks-show_task-name")
            ).to have_content task.name
        end
    end
 end

        context 'タスクが作成日時の降順に並んでいる場合' do
          it '新しいタスクが一番上に表示される' do
            visit tasks_path
            # binding.irb
            sleep 1
            FactoryBot.create(:taskfour)
            FactoryBot.create(:taskfive)
            # # binding.irb
            # click_on 'New Task'
            # fill_in 'task[name]', with: 'test_name2'
            # fill_in 'task[note]', with: 'test_note2'
            # click_button 'tasks-form_submit'
            # # created = Task.last
            # click_on 'New Task'
            # fill_in 'task[name]', with: 'test_name3'
            # fill_in 'task[note]', with: 'test_note3'
            # click_button 'tasks-form_submit'
            # # task_list = all('.task_row')
            all('td')[2].click
            expect(page).to have_content 'test_note5'
            # binding.irb
          end
        end