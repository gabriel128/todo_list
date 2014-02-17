require 'spec_helper'

describe TaskController do

  describe "GET #new" do
    it "returns a partial for creating a new task"
  end

  describe "POST #create" do
    it "returns a task to be added" do
      expect do
        post :create, task: attributes_for(:task)
      end.to change(Task, :count).by(1)
    end

    it 'redirects to todo_list#add task' do
      post :create, task: attributes_for(:task)
      expect(response).to redirect_to todo_list_add_task_url
    end
  end

  describe "GET #edit'" do
    it 'shows a partial to edit one specific task'

  end

   describe "POST #update" do
     it "update an specific task"
     it 'redirects to root path'
   end

  describe "GET 'destroy'" do
    it "destroy an specific task"
    it 'redirects to root path'
  end

end
