class BookController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def show
    @book = Book.find_by(params[:id])
  end

  def create
    @book = Book.create(book_params)
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to books_path, notice: "Successfully updated"
    else
      render :edit
    end

  def destroy
    @book.destroy
      flash[:notice] = "Book deleted"
    else
      flash[:error] = "Error destroying book"
    end
    redirect_back_or_default
  end

  private

  def set_books
    @book = Book.find_by(params[:id])
  end

  def book_params
    params.require(:book).permit(:book_title)
  end
end
