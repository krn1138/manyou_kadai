# require 'rails_helper'
# user = FactoryBot.create(:user)
# admin_user = FactoryBot.create(:admin_user)
# usertwo = FactoryBot.create(:usertwo)
# describe 'ユーザー登録' do
#     def login(user)
#         visit new_session_path
#         fill_in 'session[email]', with: user.email
#         fill_in 'session[password]', with: user.password
#         click_button 'Log in'
#         puts 'user logged in.'
#     end
#     def admin_login(admin_user)
#         visit new_session_path
#         fill_in 'session[email]', with: admin_user.email
#         fill_in 'session[password]', with: admin_user.password
#         click_button 'Log in'
#         puts 'admin user logged in.'
#     end
#     context 'ユーザが新規登録した場合' do
#       it '新規登録ができること' do
#         # login(user)
#         visit new_user_path
#         fill_in 'user[name]', with: user.name
#         fill_in 'user[email]', with: user.email
#         fill_in 'user[password]', with: user.password
#         fill_in 'user[password_confirmation]', with: user.password_confirmation
#         choose 'user_admin_なし'
#         click_button 'Create my account'
#       end
#     end
#     context 'ユーザがログインせずタスク一覧画面に飛ぼうとした場合' do
#       it 'ログイン画面に遷移すること' do
#         visit new_session_path
#       end
#     end

# describe 'セッション機能のテスト' do
#     context 'ユーザーがログインしようとした時' do
#       it '正常にログインができること' do
#         admin_login(admin_user)
#       end
#     end
# end

#     context 'ユーザーがログインした場合' do
#       it '自分の詳細画面(マイページ)に飛べること' do
#         login(user)
#         expect(page).to have_content 'karenのページ'
#       end
#     end

#     context '一般ユーザが他人の詳細画面に飛ぶ場合' do
#       usertwo = FactoryBot.create(:usertwo)
#         it 'タスク一覧画面に遷移すること' do
#           login(user)
#           # binding.pry
#           visit user_path(usertwo.id)
#           click_on 'karen'
#           expect(page).to have_content 'karenのページ'
#           expect(page).not_to have_content 'tarouのページ'
#         end
#     end

#     context 'ログインユーザーいる場合' do
#         it 'ログアウトができること' do
#           login(user)
#           click_on 'Logout'
#         end
#     end

# describe '管理画面のテスト' do
#     context '管理ユーザがログインした時' do
#         it '管理画面にアクセスできること' do
#           admin_login(admin_user)
#           # binding.pry
#           click_on '管理者画面'
#           all('td')[15].click
#           sleep(1)
#           expect(page).to have_content '2:oomiyaのページ'
#           expect(page).not_to have_content '1:karenのページ'
#         end
#     end
# end

#     context '一般ユーザーががログインした時' do
#         it '管理画面にアクセスできないこと' do
#           # usertwo = FactoryBot.create(:usertwo)
#           login(user)
#           # binding.pry
#           visit admin_users_path
#           expect(page).to have_content '管理者以外はアクセスできません'
#         end
#     end
#     context '管理ユーザーがログインした時' do
#       it 'ユーザの新規登録ができること' do
#         admin_login(admin_user)
#         # binding.pry
#         click_on '管理者画面'
#         click_on 'New User'
#         fill_in 'user[name]', with: 'hanako'
#         fill_in 'user[email]', with: 'hamako@example.com'
#         fill_in 'user[password]', with: 'kkk12345'
#         fill_in 'user[password_confirmation]', with: 'kkk12345'
#         choose 'user_admin_true'
#         click_button 'Create my account'
#         all('td')[60].click
#         # click_on "admin_users-index_user-#{user.id}-show"
#         expect(page).to have_content '30:hanakoのページ'
#       end
#     end

#     context '管理ユーザーがログインした時' do
#       it 'ユーザの詳細画面にアクセスできること' do
#         admin_login(admin_user)
#         click_on '管理者画面'
#         all('td')[6].click
#         expect(page).to have_content '1:karenのページ'
#       end
#     end

#     context '管理ユーザーがログインした時' do
#       it 'ユーザの編集画面からユーザを編集できること' do
#         admin_login(admin_user)
#         # binding.pry
#         click_on '管理者画面'
#         all('td')[7].click
#         fill_in 'user[name]', with: 'oomiyadesu'
#         fill_in 'user[password]', with: 'kkk12345'
#         fill_in 'user[password_confirmation]', with: 'kkk12345'
#         click_button 'Create my account'
#         # binding.pry
#         all('td')[51].click
#         expect(page).to have_content 'メールアドレス: kkk@example.com'
#         # expect(page).to have_content '1:karenoomiyadesuのページ'
#         # expect(page).to have_content 'test_name3'
#       end
#     end

#     context '管理ユーザーがログインした時' do
#       it 'ユーザの削除をできること' do
#         admin_login(admin_user)
#         click_on '管理者画面'
#         all('td')[8].click
#       end
#     end

# end



require 'rails_helper'
describe 'user機能', type: :system do

  user = FactoryBot.create(:user)
  admin_user = FactoryBot.create(:admin_user)
  usertwo = FactoryBot.create(:usertwo)
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

  describe 'ユーザー登録' do
    context 'ユーザが新規登録した場合' do
      it '新規登録ができること' do
        # login(user)
        visit new_user_path
        # binding.irb
        fill_in 'user[name]', with: 'jennie'
        fill_in 'user[email]', with: 'jennie@example.com'
        fill_in 'user[password]', with: 'kkk1138'
        fill_in 'user[password_confirmation]', with: 'kkk1138'
        # choose 'user_admin_なし'
        click_button 'Create my account'
      end
    end

    context 'ユーザがログインせずタスク一覧画面に飛ぼうとした場合' do
      it 'ログイン画面に遷移すること' do
        visit new_session_path
      end
    end
  end

  describe 'セッション機能のテスト' do
    context 'ユーザーがログインしようとした時' do
      it '正常にログインができること' do
        admin_login(admin_user)
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
    # usertwo = FactoryBot.create(:usertwo)
    it 'タスク一覧画面に遷移すること' do
      login(user)
      # binding.pry
      visit user_path(usertwo.id)
      click_on 'karen'
      sleep(1)
      expect(page).to have_content 'karenのページ'
      expect(page).not_to have_content 'tarouのページ'
    end
  end

  context 'ログインユーザーいる場合' do
    it 'ログアウトができること' do
      login(user)
      click_on 'Logout'
    end
  end

  describe '管理画面のテスト' do
    context '管理ユーザがログインした時' do
      it '管理画面にアクセスできること' do
        admin_login(admin_user)
        click_on '管理者画面'
        all('td')[15].click
        sleep(1)
        expect(page).to have_content '2:oomiyaのページ'
        expect(page).not_to have_content '1:karenのページ'
      end
    end
  end

  context '一般ユーザーががログインした時' do
    it '管理画面にアクセスできないこと' do
      # usertwo = FactoryBot.create(:usertwo)
      login(user)
      # binding.pry
      visit admin_users_path
      expect(page).to have_content '管理者以外はアクセスできません'
    end
  end

  context '管理ユーザーがログインした時' do
    it 'ユーザの新規登録ができること' do
      admin_login(admin_user)
      # binding.pry
      click_on '管理者画面'
      click_on 'New User'
      fill_in 'user[name]', with: 'hanako'
      fill_in 'user[email]', with: 'hamako@example.com'
      fill_in 'user[password]', with: 'kkk12345'
      fill_in 'user[password_confirmation]', with: 'kkk12345'
      choose 'user_admin_true'
      click_button 'Create my account'
      # binding.pry
      all('td')[33].click
      sleep(1)
      # click_on "admin_users-index_user-#{user.id}-show"
      expect(page).to have_content '5:hanakoのページ'
    end
  end

  context '管理ユーザーがログインした時' do
    it 'ユーザの詳細画面にアクセスできること' do
      admin_login(admin_user)
      click_on '管理者画面'
      all('td')[6].click
      sleep(1)
      expect(page).to have_content '1:karenのページ'
    end
  end

  context '管理ユーザーがログインした時' do
    it 'ユーザの編集画面からユーザを編集できること' do
      admin_login(admin_user)
      # binding.pry
      click_on '管理者画面'
      all('td')[7].click
      fill_in 'user[name]', with: 'oomiyadesu'
      fill_in 'user[password]', with: 'kkk12345'
      fill_in 'user[password_confirmation]', with: 'kkk12345'
      click_button 'Create my account'
      # binding.pry
      all('td')[24].click
      sleep(1)
      expect(page).to have_content 'メールアドレス: kkk@example.com'
      expect(page).to have_content '1:oomiyadesuのページ'
      # expect(page).to have_content 'test_name3'
    end
  end

  context '管理ユーザーがログインした時' do
    it 'ユーザの削除をできること' do
      admin_login(admin_user)
      click_on '管理者画面'
      all('td')[8].click
    end
  end

end