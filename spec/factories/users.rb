require 'faker'
require 'bcrypt'

FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    password BCrypt::Password.create('secret')
  end
end
