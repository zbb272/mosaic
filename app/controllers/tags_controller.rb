class TagsController < ApplicationController
  def create
    @tag = Tag.create(tag_params)
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
