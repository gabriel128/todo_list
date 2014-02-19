class TaskController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :update_done]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to add_task_url @task}
        format.json{ render json: {id: @task.id}, status: 200 }
      else
        render_wrong_formats format
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to todo_list_url}
        format.json { render json: @task, status: 200}
      else
        render_wrong_formats format
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to todo_list_url, notice: 'Task Removed'
  end

  def update_done
    @task.update_attribute(:done, params[:done])
    render nothing: true
  end

  private

  def render_wrong_formats format
    flash.now[:errors] =  @task.errors
    format.js { render 'task/new'}
    format.html { redirect_to action: :new }
    format.json { render json: @task.errors, status: :unprocessable_entity }
  end

  def set_task
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:description, :done, :due_date, :priority)
  end

end
