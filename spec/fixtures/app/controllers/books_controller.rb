class BooksController < ApplicationController
  before_action :set_book, only: [:edit, :update, :show, :destroy]

  def index
    @book = Book.all
  end

  def new
    @book = Book.new
    @book.build_ocenies
  end

  def show

  end

  def edit
    @book.build_ocenies
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      flash[:primary] = "Book was successfully created"
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  def update
    if @book.update(book_params)
      flash[:primary] = "Book was successfully edited"
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    flash[:primary] = "Book was successfully deleted"

    redirect_to book_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, ocenies_attributes: {})
  end
end
