require 'spec_helper'

describe TodoListController do

  before(:each) { set_user_session}
  let (:todo_list) { @user.todo_list }

  describe "#index" do
    context 'http request' do
      subject { get :index, id: todo_list }
      it { subject.should render_template :index }
    end

    context 'ajax request' do
      subject { xhr :get, :index }
      it { subject and assigns(:tasks).should eq todo_list.tasks }
      it { subject.should render_template :index }
    end
  end

  describe "#add_task'" do
    subject { post :add_task, id: create(:task)}
    it { expect { subject }.to change(todo_list.tasks, :count).by(1)}
    it { subject.should redirect_to todo_list_url }
  end

  describe "#order_by'" do
    subject(:priority_order) { xhr :get, :order_by, property: :priority }
    subject(:due_date_order) { xhr :get, :order_by, property: :due_date }
    before :each do
      todo_list.tasks.destroy_all
      todo_list.tasks << Task.new(description: "secondTask", priority: 2, due_date: 2.days.from_now)
      todo_list.tasks << Task.new(description: "firstTask", priority: 1, due_date: 1.days.from_now)
    end

    it { priority_order and assigns(:tasks).first.description.should eql 'firstTask'}
    it { due_date_order and assigns(:tasks).first.description.should eql 'firstTask'}
    it { priority_order.should render_template 'todo_list/index'}
  end

  describe 'get all task for rest' do
    subject { get :get_all_task }
    it { JSON.parse(subject.body)[1]['id'].should eql todo_list.tasks.as_json[1]['id'] }
  end
end
