class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, except:[:create]

  def create    
    @book = current_user.books.create(book_params)       
  end

  def publish    
    @book.publish if current_user.author_of? @book
  end

  def draft
    @book.draft if current_user.author_of? @book
  end

  private
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :front, :tag_ids => [])
  end
end
