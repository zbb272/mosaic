class TagsController < ApplicationController
  def create
    @tag = Tag.create(tag_params)
  end

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
