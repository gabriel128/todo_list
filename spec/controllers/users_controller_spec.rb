require 'spec_helper'

describe UsersController do

  describe "GET #new" do
    before(:each) { get :new }
    it { response.should render_template :new }
  end

  describe "POST #create" do
    context 'when valid' do
      let(:create) { post :create, user: attributes_for(:user) }
      it { expect { create }.to change(User, :count).by(1) }
      it { create; response.should redirect_to login_url }
    end

    context 'when invalid' do
      before(:each) { post :create, user: attributes_for(:user, name: nil) }
      it { should render_template :new }
    end
  end



end
