class UsersController < ApplicationController

  def display_feed
    @user = User.find(params[:id])
    @posts = User.feed_posts(@user)
    @tags = User.liked_tags(@user)
    render :feed
  end

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
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
