class BooksController < ApplicationController
	protect_from_forgery
	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@book.save
		redirect_to book_path
	end
	def index
		@book = Book.new
		@books = Book.all
	end
	def show
		@book = Book.find(params[:id])
		@user = User.find(params[:id])
	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
		book = Book.find(params[:id])
		book.update(book_params)
#		redirect_to 
	end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
