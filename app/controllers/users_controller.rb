class UsersController < ApplicationController

  def display_feed
    @user = User.find(params[:id])
    @posts = feed_posts(@user)
    @tags = liked_tags(@user)
    render :feed
  end

  #returns sorted array of tags liked by user in order of most likes
  def liked_tags(user)
    liked_tags = {}
    user.likes.each do |like|
      like.post.tags.each do | tag |
        if liked_tags[tag] == nil
          liked_tags[tag] = 1
        else
          liked_tags[tag] += 1
        end
      end
    end

    sorted_liked_tags = liked_tags.sort_by do | tag, number_of_likes |
      number_of_likes
    end
    sorted_liked_tags.collect do | tag, num |
      tag
    end
  end

  #returns sorted array of users liked by user in order of most likes
  def liked_users(user)
    liked_users = {}
    user.likes.each do |like|
      if liked_users[like.post.user] == nil
        liked_users[like.post.user] = 1
      else
        liked_users[like.post.user] += 1
      end
    end
    sorted_liked_users = liked_users.sort_by do | user, number_of_likes |
      number_of_likes
    end
    sorted_liked_users.collect do | user, num |
      user
    end
  end

  def liked_posts(user)
    liked = user.likes.collect do |like|
      like.post
    end
  end

  def feed_posts(user)
    posts = liked_posts(user)

    # posts = User.likes.posts.sample(15)
    # liked_tags(user).each do |tag|
    #   posts += tag.posts.sample(60 / liked_tags.length)
    # end
    # liked_users(user).each do |u|
    #   posts += u.posts.sample(25 / liked_tags.length)
    # end
    # posts += (Post.all - posts).sample(100 - posts.length)
    # posts
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
