require 'spec_helper'

describe TaskController do

  before(:each) { set_user_session}
  let (:todo_list) { @user.todo_list }
  let!(:task) { create(:task) }

  describe "#new" do
    it { xhr :get, :new
         response.should render_template :new }
  end

  describe "#create" do
    let(:create_request) { xhr :post, :create, task: attributes_for(:task)}
    it { expect {create_request}.to change(Task, :count).by(1)}
    it { create_request; response.should redirect_to add_task_url(id: task.id + 1) }
  end

  describe "#edit'" do
    it do
      xhr :get, :edit, id: task
      response.should render_template :edit
    end
  end

  describe "#update" do
    before(:each) { task = create(:task, description: 'adesc', priority: 2) }

    context 'with valid attributes' do
      before(:each) { xhr :patch, :update, id: task, task: attributes_for(:task, description: 'modifiedDesc') }
      it { assigns(:task).description.should eq 'modifiedDesc' }
      it { response.should redirect_to todo_list_url }
    end

    context 'with invalid attributes' do
      it do
        xhr :patch, :update, id: task, task: attributes_for(:task, description: nil, priority: 3)
        assigns(:task).priority.should eq 3
      end

      it do
        xhr :patch, :update, id: task, task: attributes_for(:task, description: nil)
        response.should render_template :new
      end
    end
  end

  describe "#destroy" do
    let(:delete_request) { xhr :delete, :destroy, id: task }
    it { expect {delete_request}.to change(Task, :count).by(-1)}
    it { delete_request; response.should redirect_to todo_list_url }
  end

  describe '#update_done' do
    it 'should update :done property for an specific task' do
      task.done = false
      xhr :patch, :update_done, id: task, done: true
      task.reload
      task.done?.should be_true
    end
  end

end

