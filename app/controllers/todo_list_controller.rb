class TodoListController < ApplicationController

  def index
    @todo_list = TodoList.find(params[:id])
  end

  def add_task
    @todo_list = TodoList.find(params[:id])
    @todo_list.tasks << Task.create(task_params)
    redirect_to todo_list_url @todo_list
  end

  def destroy
  end

  def edit
  end

  private

  def task_params
    params.require(:task).permit(:description, :done, :due_date, :priority)
  end


end
