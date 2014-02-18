class TodoRestController < ApplicationController
  skip_before_action :authorize


  #def authorize_user
  #  @user = User.find(name: params[:user][:name])
  #  respond_to do |format|
  #    if @user
  #      format.json { render json: { session_id:  @user.name + @user.password}
  #    else
  #      format.json { render json: { session_id:  @user.name + @user.password}
  #    end
  #  end
  #end

end
