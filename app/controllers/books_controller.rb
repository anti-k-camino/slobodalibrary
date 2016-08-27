class BooksController < ApplicationController
  before_action :authenticate_user!
  def create    
    @book = current_user.books.create(book_params)   
  end

  private
  def book_params
    params.require(:book).permit(:title, :description, :author, :front)
  end
end
