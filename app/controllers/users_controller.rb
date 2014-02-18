class UsersController < ApplicationController
  skip_before_action :authorize, [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to login_url, notice: 'User was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end


  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
