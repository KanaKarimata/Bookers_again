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
    @book = Book.find(params[:id])
    @book_new = Book.new
    @book_user = @book.user
  end

  def edit
    @book =Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user
    @book.update
    redirect_to book_path(@book.id)
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def books_params
    params.require(:book).permit(:title, :body)
  end
  
end
