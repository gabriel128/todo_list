require 'spec_helper'

describe TodoListController do

  describe "GET #index " do
    it "show all tasks of a user specific todo list" do
      todo_list = create(:todo_list_with_tasks)
      get 'index', id: todo_list
      expect(assigns(:tasks)).to eq todo_list.tasks
    end

    it "render the :show template" do
      todo_list = create(:todo_list_with_tasks)
      get 'index', id: todo_list
      expect(response).to render_template :index
    end
  end

  #describe "GET 'add_task'" do
  #  it "returns http success" do
  #    get 'add_task'
  #    response.should be_success
  #  end
  #end
  #
  #describe "GET 'destroy'" do
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
