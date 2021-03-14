require 'rails_helper'
describe 'ラベル作成機能', type: :system do
#   before do
#     user = FactoryBot.create(:user)
#     visit new_session_path
#     fill_in 'session[email]', with: user.email
#     fill_in 'session[password]', with: user.password
#     click_button 'Log in'

#   end
user = FactoryBot.create(:user)
def login(user)
    visit new_session_path
    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password
    click_button 'Log in'
    puts 'user logged in.'
  end
  context 'タスクを新規作成した場合' do
    it 'ラベルも登録ができること' do
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
        binding.pry
        # check 'sample1', from: '#task_label_ids_1'
        check 'sample1'
        click_button 'tasks-form_submit'
        expect(page).to have_content('sample1')
    end
  end

  context 'タスクを編集してラベルを外した場合' do
    it '一覧画面でみてもラベルが選択されていないこと' do
        
    end
  end

  context '検索した場合' do
    it 'ラベルで検索できる' do

    end
  end

end