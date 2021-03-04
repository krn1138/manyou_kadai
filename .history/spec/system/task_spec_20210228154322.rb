require 'rails_helper'
describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      task = FactoryBot.create(:task)

      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'test_note'
      end
    end
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      task = FactoryBot.build(:tasktwo)

      it '作成したタスクが表示される' do
        visit tasks_path
        click_on 'New Task'
        fill_in 'task[name]', with: task.name
        fill_in 'task[note]', with: task.note
        select 'task[limit(1i)]', from: 'limit'
        select 'task[limit(2i)]', from: 'limit'
        select 'task[limit3i)]', from: 'limit'
        click_button 'tasks-form_submit'
        created = Task.last
        expect(
            find_by_id("tasks-index_task-#{created.id}-note")
        ).to have_content task.note
        
        expect(
            find_by_id("tasks-index_task-#{created.id}-name")
        ).to have_content task.name

        expect(page).to have_select('limit', selected: 'DateTime')
      end
    end
 end

  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      task = FactoryBot.create(:task)
      it '該当タスクの内容が表示される' do
      
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
    FactoryBot.create(:taskfour)
    FactoryBot.create(:taskfive)
    it '新しいタスクが一番上に表示される' do
      visit tasks_path
      all('td')[2].click
      expect(page).to have_content 'test_note5'
    end
  end

  context '終了期限でソートするというリンクを押した場合' do
    FactoryBot.create(:taskfour)
    FactoryBot.create(:taskfive)
    it '終了期限の降順に並び替えられたタスク一覧が表示される' do
      binding.pry 
      visit tasks_path
      all('td')[2].click
      expect(page).to have_content 'test_note5'
    end
  end

end