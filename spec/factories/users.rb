require 'faker'
require 'bcrypt'

FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    password 'secret'
    password_confirmation 'secret'
    todo_list { create(:todo_list_with_tasks) }
  end

  factory :user_without_todo do
    name Faker::Name.name
    password 'secret'
    password_confirmation 'secret'
  end
end
