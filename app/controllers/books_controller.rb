class BooksController < ApplicationController

  before_action :authenticate_user!, only: [:restricted]
  before_action :set_book, only: %i[ show edit update destroy ]
  

  def restricted
  end

  def home
    @books = Book.all
    # if current_user
    #   @books = current_user.books
    # end
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = current_user.books.build(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Book was successfully added." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
    # redirect_to books_path
  end

  def edit
  end

  def show
    @book = books.all.find(params[:id])
  end

  def update
    @book = current_user.books.all.find(params[:id])
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @book = current_user.books.all.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_book
      @book = books.all.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:tittle, :author_first_name, :author_last_name, :pub_year, :edition, :blurb, :physical_description)
    end

  
end
