require 'spec_helper'

describe TaskController do

  let(:user) { create(:user) }
  let(:task) { build(:task) }

  before :each do
    session[:user_id] = user.id
  end

  context 'when valid user' do

    let(:json) { {format: 'json', task: {description: task.description, priority: 1, due_date: 1.day.from_now}} }
    let(:create_request) { post :create, json }
    let(:json_for_update) { {format: 'json', id: get_task_id, task: {description: task.description, priority: 3, due_date: 1.day.from_now}} }
    let(:update_request) { patch :update, json_for_update }

    it { expect { create_request }.to change(Task, :count).by(1) }
    it { create_request; JSON.parse(response.body)['id'].should_not eql nil }
    it { create_request; expect { delete :destroy, {id: get_task_id} }.to change(Task, :count).by(-1) }

    it '#update_done' do
      create_request
      task_id = get_task_id
      patch :update_done, {id: task_id, done: true}
      Task.find(task_id).done?.should be_true
    end

    it '#update' do
      create_request
      update_request
      Task.find(get_task_id).priority.should eql 3
      response.code.should eql "200"
    end

    it 'should throw error when not valid' do
      create_request
      update_request
      patch :update, {format: 'json', id: get_task_id, task: {description: nil, priority: 3, due_date: 1.day.from_now}}
      response.code.should eql "422"
    end
  end
end



