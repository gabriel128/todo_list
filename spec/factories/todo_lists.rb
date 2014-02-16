# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo_list do
    factory :todo_list_with_tasks do
      tasks {  build_list :task, 3 }
    end
  end


end
