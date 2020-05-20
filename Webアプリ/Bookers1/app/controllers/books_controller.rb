class BooksController < ApplicationController
  def index
  end

  def show
  	@book = Book.find(params[:id])
  end

  def new
  	@book = Book.new
    @books = Book.all
  end

  def create
  	@book = Book.new(book_params)
  	if @book.save
      flash[:success] = 'Book was successfully create'
  	  redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = 'Book was successfully update'
      redirect_to book_path(book)
    else
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to new_book_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
