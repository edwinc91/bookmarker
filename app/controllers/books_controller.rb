class BooksController < ApplicationController

  before_action :require_current_user

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save
      redirect_to books_path
    else
      render json: {
        error: {
          message: @book.errors.full_messages.to_sentence
        }
      }
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @books = current_user.books
  end

  def delete
  end

  private

  def book_params
    params.require(:book).permit(:name, :book_type, :website, :volume, :chapter, :page, :description)
  end
end
