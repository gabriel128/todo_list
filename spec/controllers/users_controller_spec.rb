require 'spec_helper'

describe UsersController do

  describe "GET #new" do
    subject { get :new }
    it { subject.should render_template :new }
  end

  describe "POST #create" do
    context 'when valid' do
      subject { post :create, user: attributes_for(:user) }
      it { expect { subject }.to change(User, :count).by(1) }
      it { subject.should redirect_to login_url }
    end

    context 'when invalid' do
      subject { post :create, user: attributes_for(:user, name: nil) }
      it { subject.should render_template :new }
    end
  end
end
