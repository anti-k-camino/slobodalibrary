class TagsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
  end  

  def show
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
