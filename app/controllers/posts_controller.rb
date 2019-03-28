class PostsController < ApplicationController

  def create_like
    @post = Post.find(params[:id])
    checker = Like.find_by(user_id: session["user_id"], post_id: params[:id])
    if !checker.nil?
      checker.destroy
      redirect_to post_path(@post)
    else
      @post.likes << Like.create(:user_id => session["user_id"])
    # byebug
      redirect_to post_path(@post)
    end
  end

  def index
    if params[:post_search]
      @posts = Post.where('title LIKE ?', "#{params[:post_search]}")
      tags = Tag.where('name LIKE ?', "#{params[:post_search]}")
      tags.each do | tag |
        @posts += tag.posts
      end
    else
      @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.tags.build
  end

  def create
    # byebug
    # p = post_params
    # p[:tag_ids].reject!(&:blank?)
    @post = Post.new(post_params)
    # @post = Post.create!(post_params)
    # byebug
    @post.user_id = session["user_id"]
    @post.save!
    # picture = params.require(:post).permit(post: [:picture])
    # picture = params[:post][:picture]
    # byebug
    # @post.picture.attach(params[:post][:picture])
    # byebug
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:img_url, :title, :description, :tag_ids => [], tags_attributes: [:name])
  end


end
