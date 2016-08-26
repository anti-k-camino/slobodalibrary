class WelcomeController < ApplicationController
  def index
    @books = Book.weekly
  end
end
