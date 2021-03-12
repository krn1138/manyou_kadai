require 'rails_helper'
describe 'タスク管理機能', type: :system do
    def login(user)
      visit new_session_path
      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password
      click_button 'Log in'
      puts 'user logged in.'
    end
    def admin_login(admin_user)
      visit new_session_path
      fill_in 'session[email]', with: admin_user.email
      fill_in 'session[password]', with: admin_user.password
      click_button 'Log in'
      puts 'admin user logged in.'
    end
    user = FactoryBot.create(:user)
    admin_user = FactoryBot.create(:admin_user)
    FactoryBot.create(:task, user_id: user.id)
    FactoryBot.create(:tasktwo)
    FactoryBot.create(:taskthree)
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        login(user)
        visit tasks_path
        binding.pry
        expect(page).to have_content 'test_note1'
      end
    end
  end
  describe '新規作成機能' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        login(user)
        visit tasks_path
        click_on 'New Task'
        date = DateTime.now
        fill_in 'task[name]', with: 'タスク'
        fill_in 'task[note]', with: 'note'
        select date.year, from: 'task[limit(1i)]'
        select date.month, from: 'task[limit(2i)]'
        select date.day, from: 'task[limit(3i)]'
        select '着手中', from: 'task[status]'
        select '高', from: 'task[choice]'
        click_button 'tasks-form_submit'
        expect(page).to have_content('note')
      end
    end
 end
  describe '詳細表示機能' do
    context '任意のタスク詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        login(user)
        task = FactoryBot.create(:task)
        visit tasks_path
        click_on "tasks-index_task-#{task.id}-show"
        expect(page).to have_content task.note
        expect(page).to have_content task.name
      end
    end
  end
  context 'タスクが作成日時の降順に並んでいる場合' do
    it '新しいタスクが一番上に表示される' do
      login(user)
      # task2 = FactoryBot.create(:tasktwo)
      # FactoryBot.create(:taskthree)
      visit tasks_path
      click_on "tasks-index_task-#{task2.id}-show"
      expect(page).to have_content 'test_note2'
      expect(page).not_to have_content 'test_note1'
    end
  end
  context '終了期限でソートするというリンクを押した場合' do
    it '終了期限の降順に並び替えられたタスク一覧が表示される' do
      login(user)
      FactoryBot.create(:taskthree)
      FactoryBot.create(:tasktwo)
      visit tasks_path
      # binding.irb
      click_on "終了期限でソートする"
      all('td')[6].click
      expect(page).to have_content 'test_name3'
    end
  end
  context '検索をした場合' do
    # FactoryBot.create(:task_sarch)
    it 'タイトルで検索できる' do
      login(user)
      FactoryBot.create(:taskthree)
      FactoryBot.create(:tasktwo)
      visit tasks_path
      fill_in 'title', with: 'test_name2'
      click_button 'Serch'
      all('td')[6].click
      expect(page).to have_content 'test_name2'
    end
  end
  context '検索をした場合' do
    it 'ステータスで検索できる、かつステータスとタイトル両方で検索できる' do
      login(user)
      FactoryBot.create(:taskthree)
      FactoryBot.create(:tasktwo)
      visit tasks_path
      select '着手中', from: 'status'
      fill_in 'title', with: 'test_name2'
      click_button 'Serch'
      all('td')[6].click
      expect(page).to have_content '着手中'
      expect(page).to have_content 'test_note2'
      expect(page).not_to have_content 'test_name3'
    end
  end
  context '優先順位でソートするというリンクを押した場合' do
    it 'タスクに対して、優先順位（高中低）が登録できる' do
      login(user)
      FactoryBot.create(:taskthree)
      FactoryBot.create(:task)
      FactoryBot.create(:tasktwo)
      visit tasks_path
      click_on "優先順位でソートする"
      all('td')[6].click
      expect(page).to have_content 'test_name1'
      expect(page).not_to have_content 'test_name2'
      expect(page).not_to have_content 'test_name3'
    end
  end
end