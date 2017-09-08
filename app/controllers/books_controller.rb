class BooksController < ApplicationController

  def index
    @books = Book.search(params[:search])
    @books = Book.order("title").page(params[:page]).per(25)
  end

  def new
    @book = Book.new
  end

  def create
    Book.create(book_params)
    redirect_to root_path
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    redirect_to root_path
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to root_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :year, :author, :booktype, :genre, :classification)
  end

end