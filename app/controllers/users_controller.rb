class UsersController < ApplicationController

  def display_feed
    @user = User.find(params[:id])
    @posts = feed_posts(@user)
    @tags = liked_tags(@user)
    render :feed
  end

  def liked_tags(user)
    liked = user.posts.collect do |post|
      post.tags
    end
    liked.uniq!
  end

  def feed_posts(user)
    posts = user.posts
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
