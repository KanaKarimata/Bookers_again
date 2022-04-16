class BooksController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def books_params
    params.require(:book).permit(:title, :body)
  end
  
end
