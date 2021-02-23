require 'rails_helper'

RSpec.describe Task, type: :model do
  task = Task.new(
    name: 'test_task',
    note: 'test_task_note'
  )
  expect(task).to be_valid
end
