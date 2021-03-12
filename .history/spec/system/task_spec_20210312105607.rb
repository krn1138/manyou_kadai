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
    usertwo = FactoryBot.create(:usertwo)
    task = FactoryBot.create(:task, user_id: user.id)
    task2 = FactoryBot.create(:tasktwo, user_id: user.id)
    task3 = FactoryBot.create(:taskthree, user_id: user.id)

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのタスク一覧が表示される' do
        login(user)
        visit tasks_path
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
      visit tasks_path
      all('td')[6].click
      # page上の<td>全部を取得して,index番号[6]を指定して1番目のShowボタンを選んでる.

      # ---------------------------------------------------------
      # なぜここでID値を指定しないで<td>タグをindex番号から選んでいるのか:
      # タグのid値でボタンを選んでしまうと画面上のボタンの順番は関係なしに一致するボタンをクリックしてしまう
      # そうなると[新しいタスクが一番上に表示される]の確認が満たせないため.
      # ---------------------------------------------------------

      # click_on "tasks-index_task-#{task.id}-show" (後で消す)
      expect(page).to have_content 'test_note1'
      expect(page).not_to have_content 'test_note2'

      visit tasks_path
      all('td')[15].click
      # page上の<td>全部を取得して,index番号[15]を指定して2番目のShowボタンを選んでる.

      # click_on "tasks-index_task-#{task2.id}-show" (後で消す)
      expect(page).to have_content 'test_note2'
      expect(page).not_to have_content 'test_note1'
    end
  end

  context '終了期限でソートするというリンクを押した場合' do
    it '終了期限の降順に並び替えられたタスク一覧が表示される' do
      login(user)
      # FactoryBot.create(:taskthree, user: user)
      # FactoryBot.create(:tasktwo)
      visit tasks_path
      click_on "終了期限でソートする"
      # binding.pry
      # all('td')[6].click
      limit = all('.limit')
      binding.irb
      expect(limit[0]).to have_content '2021-03-21'
      expect(limit[1]).to have_content '2021-03-11'
      expect(limit[2]).to have_content '2021-03-11'
    end
  end

  context '検索をした場合' do
    # FactoryBot.create(:task_sarch)
    it 'タイトルで検索できる' do
      login(user)
      # FactoryBot.create(:taskthree)
      # FactoryBot.create(:tasktwo)
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
      # FactoryBot.create(:taskthree)
      # FactoryBot.create(:tasktwo)
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
      # FactoryBot.create(:taskthree)
      # FactoryBot.create(:task)
      # FactoryBot.create(:tasktwo)
      visit tasks_path
      click_on "優先順位でソートする"
      # binding.pry
      # all('td')[6].click
      choice = all('.choice')
      expect(choice[0]).to have_content '高'
      expect(choice[1]).to have_content '中'
      expect(choice[2]).to have_content '低'
    end
  end
end