require 'faker'

FactoryGirl.define do
  factory :task do
    association :todo_list
    done false
    description Faker::Lorem.characters(40)
    priority 1
    due_date 2.days.from_now

    factory :invalid_task do
      description Faker::Lorem.characters(256)
    end
  end
end
