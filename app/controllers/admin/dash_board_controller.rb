class Admin::DashBoardController < Admin::BaseController
  before_action :authenticate_user!
  def index
    @tag = Tag.new
    @tags = Tag.all
  end
end
