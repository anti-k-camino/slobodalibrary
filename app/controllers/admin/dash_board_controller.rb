class Admin::DashBoardController < Admin::BaseController
  def index
    @tag = Tag.new
  end
end
