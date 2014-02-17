require 'faker'
require 'bcrypt'

FactoryGirl.define do
  factory :user do
    name 'testUser'
    password 'secret'
    password_confirmation 'secret'
    todo_list { create(:todo_list_with_tasks) }
  end
end
