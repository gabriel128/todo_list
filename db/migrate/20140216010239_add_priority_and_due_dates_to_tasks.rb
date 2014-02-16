class AddPriorityAndDueDatesToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :priority, :integer, default: 10
    add_column :tasks, :due_date, :date, default: nil
  end
end
