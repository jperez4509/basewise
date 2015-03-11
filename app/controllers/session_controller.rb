class SessionController < ApplicationController
  def create
    @user = User.authenticate(params[:user])

    if @user
      login_as(@user)
      redirect_to projects_path
    else
      flash[:notice] = "Email or password is incorrect"
      @user = User.new
      render "new"
    end
  end

  def destroy
    logout_user

    redirect_to signin_path
  end
  def new
    @user = User.new
  end
end
