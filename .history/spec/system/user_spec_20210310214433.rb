require 'rails_helper'
describe 'ユーザー登録' do
    def login(user)
        visit new_session_path
        fill_in 'session[email]', with: user.email
        fill_in 'session[password]', with: user.password
        click_button 'Log in'
        puts 'user logged in.'
      end
    context 'ユーザの新規登録した場合' do
      it 'ユーザの新規登録ができること' do
        login(user)
        visit new_user_path
        fill_in 'session[email]', with: user.name
        fill_in 'session[email]', with: user.email
        fill_in 'session[email]', with: user.password
        fill_in 'session[email]', with: user.password_confirmation
        choose 'なし'
        click_button 'Create my account'
      end
    end
  end