class BooksController < ApplicationController

  # skip_before_action :verify_authenticity_token

  before_action :require_current_user

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = current_user.books
  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save

    else
      render json: {
        error: {
          message: @book.errors.full_messages.to_sentence
        }
      }
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      render json: @book
    else
      render json: {
        error: {
          message: @book.errors.full_messages.to_sentence
        }
      }
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :book_type, :website, :volume, :chapter, :page, :description)
  end
end
