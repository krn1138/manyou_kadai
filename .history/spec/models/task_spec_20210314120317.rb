require 'rails_helper'
RSpec.describe Task, type: :model do
  before do
    # user = FactoryBot.create(:user)
    # admin_user = FactoryBot.create(:admin_user)  
    visit new_user_path
    fill_in 'user[name]', with: 'hanako'
    fill_in 'user[email]', with: 'hamako@example.com'
    fill_in 'user[password]', with: 'kkk12345'
    fill_in 'user[password_confirmation]', with: 'kkk12345'
    choose 'user_admin_true'
    click_button 'Create my account'
  end

  def admin_login(admin_user)
    visit new_session_path
    fill_in 'session[email]', with: admin_user.email
    fill_in 'session[password]', with: admin_user.password
    click_button 'Log in'
    puts 'admin user logged in.'
  end

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


