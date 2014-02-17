class TodoList < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  belongs_to :user

  def empty_tasks
    tasks.destroy_all
  end

  def get_tasks_orderer_by task_property
    tasks.order task_property
  end

end
