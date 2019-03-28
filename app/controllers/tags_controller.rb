class TagsController < ApplicationController
  before_action :admin_authorized, only: [:edit, :destroy]

  def create
    @tag = Tag.create(tag_params)
  end

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.delete
    redirect_to tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
