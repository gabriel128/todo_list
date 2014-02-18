require 'spec_helper'

describe SessionController do

  let(:user) { create(:user) }

  describe 'on session creation' do
    context 'with valid credentials' do
      before(:each) { post :create, name: user.name, password: user.password }
      it { session[:user_id].should_not eql nil }
      it { response.should redirect_to todo_list_url }
    end

    context 'with invalid credentials' do
      before(:each) { post :create, name: user.name }
      it { session[:user_id].should eql nil }
      it { response.should redirect_to login_url }
    end
  end

  describe 'on session destroy' do
    before(:each) { delete :destroy }
    it { session[:user_id].should be nil }
    it { response.should redirect_to login_url }
  end
end
