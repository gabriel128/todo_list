class SessionController < ApplicationController
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to todo_list_url
    else
      redirect_to login_url, notice: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    session[:todo_list_id] = nil
    redirect_to login_url, notice: "Logged out"
  end

  def authorize_user
    @user = User.find_by(name: params[:user][:name])
    respond_to do |format|
      if @user
        session[:user_id] = @user.id
        format.json { render json: {id: @user.id}}
      else
        format.json { render json: { error_message: "Not valid user or password" }}
      end
    end
  end
end
