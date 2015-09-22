class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = Book.all
  end
  def show
  end
  def new
    @book = Book.new
  end
  def create
    @book = Book.create(book_params)
    redirect_to books_path
  end
  def edit
  end
  def update
    @book.update(book_params)
    redirect_to book_path(@book)
  end
  def destroy
    @book.destroy
    redirect_to books_path
  end
  private
  def set_book
    @book = Book.find(params[:id])
  end
  def book_params
    params.require(:book).permit(:author, :title)
  end
end