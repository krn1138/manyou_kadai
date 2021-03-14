require 'rails_helper'
describe 'ラベル作成機能', type: :system do
#   before do
#     user = FactoryBot.create(:user)
#     visit new_session_path
#     fill_in 'session[email]', with: user.email
#     fill_in 'session[password]', with: user.password
#     click_button 'Log in'

#   end
# user = FactoryBot.create(:user)
label = FactoryBot.create(:label)
labeltwo = FactoryBot.create(:label_two)
labelthree = FactoryBot.create(:label_three)
task = FactoryBot.create(:task, user_id: user_id)
task2 = FactoryBot.create(:tasktwo, user_id: user_id)
task.labels << label
task.labels << labeltwo
task2.labels << labelthree

# label = FactoryBot.create(:label, label_id: task_id)
# label = FactoryBot.create(:label, task_id: task_id)
# label = FactoryBot.create(:label, task_id: label_id)
# label = FactoryBot.create(:label, title: task_id)


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
        box = find('#task_label_ids_1')
        box.check
        click_button 'tasks-form_submit'
        expect(page).to have_content('sample1')
    end
  end

  context 'ラベル付きのタスクを作成した場合' do
    it 'showでみてもラベルが選択されていること' do
        login(user)
        visit tasks_path
        # binding.pry
        all('td')[6].click
        sleep(1)
        expect(page).to have_content 'sample1'
        expect(page).to have_content 'sample2'
        expect(page).not_to have_content 'sample3'
    end
  end

  context '検索した場合' do
    it 'ラベルで検索できる' do
        login(user)
        visit tasks_path
        
        select 'sample1', from: 'label_id'
        click_button 'Serch'
        all('td')[6].click
        expect(page).to have_content 'sample1'
        expect(page).not_to have_content 'sample3'
    end
  end

end