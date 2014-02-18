require 'spec_helper'

describe TodoRestController do

  let(:user) { create(:user) }

  context 'when valid user' do

    it '#authorize should return a session-id' do
      request.accept = "application/json"
      json = { format: 'json', user: { name: user.name, password:  user.password }}
      post :authorize_user, json
      JSON.parse(response.body)["session_id"].should eq user.name + user.password
    end

    it 'should be able to get a todo list in json from user'

    it 'should be able to add a task'
    it 'should be able to remove a task by id'
    it 'should be able to update a task by id'
    it 'should be able to return an order todo list by priority'
    it 'should be able to return an order todo list by due date'

  end

  context 'when invalid user' do
    it 'should not return a session-id'
    it 'should not be able to get a todo list'
  end

end
