require 'spec_helper'

describe User do

  before :each do
    @user = build(:user)
  end

  context 'valid user' do
    it 'has unique name and password' do
      expect do
        @user.save
      end.to change(User, :count).by(1)
    end
  end

  context 'invalid user' do
    it 'has not to be saved when invalid' do
      @user.save
      @invalid_user = build(:user, name: @user.name)
      expect(@invalid_user).to be_invalid
    end
  end
end
