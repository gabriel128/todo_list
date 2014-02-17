require 'spec_helper'

describe TodoListController do

  before :each do
    user = create(:user)
    session[:user_id] = user.id
    @todo_list = user.todo_list
  end

  describe "GET #index " do
    it "show all tasks of a user specific todo list" do
      get 'index'
      expect(assigns(:todo_list)).to eq @todo_list
    end

    it "render the :show template" do
      get 'index', id: @todo_list
      expect(response).to render_template :index
    end
  end

  describe "Post #add_task'" do
    it "add one more task" do
      expect do
        post 'add_task', id: create(:task)
      end.to change(@todo_list.tasks, :count).by(1)
    end

    it "redirect to #index" do
      post 'add_task', id: create(:task)
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
