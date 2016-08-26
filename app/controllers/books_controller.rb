class BooksController < ApplicationController
  before_action :authenticate_user!
  def create
    @book = Book.new(book_params)
    @book.save
  end
  private
  def book_params
    params.require(:book).permit(:title, :description, :author)
  end
end
