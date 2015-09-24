class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  def index
    @books = policy_scope(Book)
  end
  def show
    @owner = User.find(Collection.where(book_id:@book.id)[0][:user_id])
    @collection = Collection.where(book_id:@book.id)[0]
  end
  def new
    @book = Book.new
    authorize @book
    @collection = Collection.new
  end
  def create
    @book = current_user.books.build(book_params)
    authorize @book
    @book.save
    @collection = Collection.new(book_id: @book.id, user_id: current_user.id, available: true)
    @collection.save
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
    authorize @book
  end
  def book_params
    params.require(:book).permit(:author, :title, :description)
  end
end
