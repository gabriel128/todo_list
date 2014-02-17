class TaskController < ApplicationController

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to add_task_url @task}
      else
        flash.now[:errors] =  @task.errors
        format.js { render 'task/new'}
        format.html { redirect_to action: :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to todo_list_url}
      else
        flash.now[:errors] =  @task.errors
        format.js { render 'task/new'}
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] =  'Task Removed'
    redirect_to todo_list_url
  end

  private

  def task_params
    params.require(:task).permit(:description, :done, :due_date, :priority)
  end

end
