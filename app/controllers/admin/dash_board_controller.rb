class Admin::DashBoardController < Admin::BaseController  
  def index
    @tag = Tag.new
    @tags = Tag.all
  end
end
