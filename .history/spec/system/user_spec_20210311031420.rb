require 'rails_helper'
user = FactoryBot.create(:user)
    # admin_user = FactoryBot.create(:admin_user)
describe 'ユーザー登録' do
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
    context 'ユーザが新規登録した場合' do
      it '新規登録ができること' do
        # login(user)
        visit new_user_path
        fill_in 'user[name]', with: user.name
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation
        choose 'user_admin_なし'
        click_button 'Create my account'
      end
    end
    context 'ユーザがログインせずタスク一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移すること' do
        visit new_session_path



        end
        end

describe 'セッション機能のテスト' do
    context 'ユーザーがログインしようとした時' do
      it '正常にログインができること' do
        login(user)
      end
    end
end

    context 'ユーザーがログインした場合' do
      it '自分の詳細画面(マイページ)に飛べること' do
        login(user)
        expect(page).to have_content 'karenのページ'
      end
    end
    context '一般ユーザが他人の詳細画面に飛ぶ場合' do
        it 'タスク一覧画面に遷移すること' do
        end
    end

    context 'ログインユーザーいる場合' do
        it 'ログアウトができること' do
            admin_login(admin_user)

        end
    end
  end