class UsersController < ApplicationController

  def settings
    @user = User.find(params[:id])
    if session["user_id"] == @user.id
      render :settings
    else
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :bio, :password, :password_confirmation)
  end


end
