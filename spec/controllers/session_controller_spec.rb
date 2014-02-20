require 'spec_helper'

describe SessionController do

  let(:user) { create(:user) }

  describe 'on session creation' do
    context 'with valid credentials' do
      subject { post :create, name: user.name, password: user.password }
      it { subject and session[:user_id].should_not eql nil }
      it { subject.should redirect_to todo_list_url }
    end

    context 'with invalid credentials' do
      subject { post :create, name: user.name }
      it { session[:user_id].should eql nil }
      it { subject.should redirect_to login_url }
    end
  end

  describe 'on session destroy' do
    subject { delete :destroy }
    it { session[:user_id].should be nil }
    it { subject.should redirect_to login_url }
  end

  describe 'user authorization by json' do
    it '#authorize should return a session_id' do
      json = {format: 'json', user: {name: user.name, password: user.password}}
      post :authorize_user, json
      JSON.parse(response.body)["id"].should eq user.id
    end
  end
end
