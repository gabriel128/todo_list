class Task < ActiveRecord::Base
  belongs_to :todo_list

  validates_date :due_date, :on_or_after => lambda { Date.current }
  validates :description, length: { maximum: 255}, presence: true, allow_blank: false
  validates :due_date, presence: true
  validates :priority, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10}

end
