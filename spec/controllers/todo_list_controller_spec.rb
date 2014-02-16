require 'spec_helper'

describe TodoListController do

  describe "GET #index " do
    it "show all tasks of a user specific todo list" do
      todo_list = create(:todo_list_with_tasks)
      get 'index', id: todo_list
      expect(assigns(:todo_list)).to eq todo_list
    end

    it "render the :show template" do
      todo_list = create(:todo_list_with_tasks)
      get 'index', id: todo_list
      expect(response).to render_template :index
    end
  end

  describe "Post #add_task'" do
    it "add one more task" do
      todo_list = create(:todo_list_with_tasks)
      expect do
        post 'add_task', task: attributes_for(:task), id: todo_list.id
      end.to change(todo_list.tasks, :count).by(1)
    end

    it "redirect to #index" do
      todo_list = create(:todo_list_with_tasks)
      post 'add_task', task: attributes_for(:task), id: todo_list.id
      expect(response).to redirect_to todo_list_url
    end
  end

  #describe "POST #destroy" do
  #  it "returns http success" do
  #    get 'destroy'
  #    response.should be_success
  #  end
  #end

  #
  #describe "GET 'edit'" do
  #  it "returns http success" do
  #    get 'edit'
  #    response.should be_success
  #  end
  #end

end
