class TodoListController < ApplicationController

  def index
    @tasks = TodoList.find(params[:id]).tasks
  end

  def add_task
  end

  def destroy
  end

  def edit
  end

end
