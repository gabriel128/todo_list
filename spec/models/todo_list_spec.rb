require 'spec_helper'

describe 'Todo List' do

  context 'empty' do
    it 'has to save when a task is added' do
      expect do
        a_todo_list = create(:todo_list)
        a_todo_list.tasks << build(:task)
      end.to change(Task, :count).by(1)
    end
  end

  context 'with tasks' do
    before :each do
      @todo_list = create(:todo_list_with_tasks)
    end

    it 'has to have 3 tasks'  do
      expect(@todo_list).to have(3).tasks
    end

    it 'has to empty all at Empty action'  do
      @todo_list.empty_tasks
      expect(@todo_list).to have(0).tasks
    end

    it 'can get task sort by priority' do
      todo_list = create(:todo_list)
      todo_list.tasks <<  build(:task, priority: 1) << build(:task, priority: 6) << build(:task, priority: 2)
      priority_list = []
      todo_list.get_tasks_orderer_by(:priority).each do |task|
        priority_list << task.priority
      end
      expect(priority_list).to match_array [1,2,6]
    end

    it 'can get task sort by due date' do
      todo_list = create(:todo_list)
      todo_list.tasks <<  build(:task, due_date: 1.day.from_now) << build(:task, due_date: 6.days.from_now)
      todo_list.tasks << build(:task, due_date: 2.days.from_now)
      date_list = []
      todo_list.get_tasks_orderer_by(:due_date).each do |task|
        date_list << task.due_date.strftime("%m/%d/%Y")
      end
      expect(date_list).to eq [1.day.from_now.strftime("%m/%d/%Y"),
                                   2.days.from_now.strftime("%m/%d/%Y"),
                                   6.days.from_now.strftime("%m/%d/%Y")]
    end
  end



end