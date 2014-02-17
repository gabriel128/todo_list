class TodoListController < ApplicationController
  before_action :get_todo_list

  def index

  end

  def add_task
    @todo_list.tasks << Task.find(params[:id])
    redirect_to todo_list_url
  end

  def destroy
  end

  def edit
  end

  def order_by
    @todo_list.tasks.reorder('priority')
    render 'todo_list/index'
  end

  private

  def get_todo_list
    create_todo_list_if_none
    set_session_todo_list_id
    @todo_list = TodoList.find(session[:todo_list_id])
  end

  def set_session_todo_list_id
    session[:todo_list_id] ||= User.find(session[:user_id]).todo_list.id
  end

  def create_todo_list_if_none
    @user = User.find(session[:user_id])
    @user.todo_list = TodoList.create unless @user.todo_list
  end


end
