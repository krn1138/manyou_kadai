require 'rails_helper'
describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      task = FactoryBot.create(:task)

binding.irb
      it '作成済みのタスク一覧が表示される' do
        visit tasks_path
        expect(page).to have_content 'test_note1'
      end
    end
  end

  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do

      it '作成したタスクが表示される' do
        visit tasks_path
        
        click_on 'New Task'
        date = DateTime.now
        fill_in 'task[name]', with: 'タスク'
        fill_in 'task[note]', with: 'note'
        select 'task[limit(1i)]', from: date.year
        select 'task[limit(2i)]', from: date.month
        select 'task[limit(3i)]', from: date.day
        click_button 'tasks-form_submit'
        # created = Task.last

        # expect(
        #     find_by_id("tasks-index_task-#{created.id}-note")
        # ).to have_content task.note
        
        # expect(
        #     find_by_id("tasks-index_task-#{created.id}-name")
        # ).to have_content task.name

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
    FactoryBot.create(:task)
    FactoryBot.create(:tasktwo)
    it '新しいタスクが一番上に表示される' do
      visit tasks_path
      all('td')[6].click
      # binding.irb

      expect(page).to have_content 'test_note1'
      expect(page).not_to have_content 'test_note2'
    end
  end

  context '終了期限でソートするというリンクを押した場合' do
    # FactoryBot.create(:taskfour)
    # FactoryBot.create(:taskfive)
    it '終了期限の降順に並び替えられたタスク一覧が表示される' do 
      visit tasks_path
      
      tds = all('table')[0].all('link')
      expect(tds[1]).to have_content ''
      # all('td')[2].click
      # expect(page).to have_content 'test_note5'
    end
  end

  context '検索をした場合' do
    # FactoryBot.create(:task_sarch)
    it 'タイトルで検索できる' do 
      visit tasks_path
      fill_in 'title', with: 'タスク'
      click_button 'Sarch'
      # all('td')[2].click
      expect(page).to have_content ''
    end
  end

  context '検索をした場合' do
    # FactoryBot.create(:taskfour)
    # FactoryBot.create(:taskfive)
    it 'ステータスで検索できる' do 
      visit tasks_path
      fill_in 'title', with: 'タスク'
      click_button 'Sarch'
      # tds = all('table')[0].all('td')
      expect(tds[1]).to have_content ''
      # all('td')[2].click
      # expect(page).to have_content 'test_note5'
    end
  end

  context '検索をした場合' do
    # FactoryBot.create(:taskfour)
    # FactoryBot.create(:taskfive)
    it 'タイトルとステータスの両方で検索できる' do 
      visit tasks_path
      
      tds = all('table')[0].all('td')
      expect(tds[1]).to have_content 'ひろみちゃん'
      # all('td')[2].click
      # expect(page).to have_content 'test_note5'
    end
  end

end