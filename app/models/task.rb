class Task < ActiveRecord::Base
  belongs_to :todo_list

  validates_date :due_date, :on_or_after => lambda { Date.current }, message: 'Date should be in the future'
  validates :description, length: { maximum: 255}, presence: true, allow_blank: false
  validates :due_date, presence: true
  validates :priority, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 10}

  def self.due_date
    due_date.strftime("%m/%d/%y")
  end

end
