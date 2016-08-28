class TagsController < ApplicationController
  before_action :authenticate_user!
  def create
    @tag = Tag.new(tag_params)
    @tag.save
  end 

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
