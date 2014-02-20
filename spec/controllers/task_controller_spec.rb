require 'spec_helper'

describe TaskController do

  before(:each) { set_user_session }
  let (:todo_list) { @user.todo_list }
  let!(:task) { create(:task) }

  describe "#new" do
    subject { xhr :get, :new }
    it { subject.should render_template :new }
  end

  describe "#create" do
    subject { xhr :post, :create, task: attributes_for(:task) }
    it { expect { subject }.to change(Task, :count).by(1) }
    it { subject.should redirect_to add_task_url(id: task.id + 1) }
  end

  describe "#edit'" do
    subject { xhr :get, :edit, id: task }
    it { subject.should render_template :edit }
  end

  describe "#update" do
    let(:task) { create(:task, description: 'adesc', priority: 2) }

    context 'with valid attributes' do
      subject { xhr :patch, :update, id: task, task: attributes_for(:task, description: 'modifiedDesc') }
      it { subject and assigns(:task).description.should eq 'modifiedDesc' }
      it { subject.should redirect_to todo_list_url }
    end

    context 'with invalid attributes' do
      subject { xhr :patch, :update, id: task, task: attributes_for(:task, description: nil, priority: 3) }
      it { subject and assigns(:task).priority.should eq 3 }
      it { subject.should render_template :new }
    end
  end

  describe "#destroy" do
    subject { xhr :delete, :destroy, id: task }
    it { expect { subject }.to change(Task, :count).by(-1) }
    it { subject.should redirect_to todo_list_url }
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

