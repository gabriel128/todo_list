class AddTodoListIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :todo_list_id, :integer
  end
end
