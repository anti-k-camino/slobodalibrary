class BooksController < ApplicationController
  before_action :authenticate_user!
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    respond_to  do |format|
      if @book.save
        format.js
      end
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :description, :author, :front)
  end
end
