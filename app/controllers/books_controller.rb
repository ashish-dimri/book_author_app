class BooksController < ApplicationController
	protect_from_forgery with: :exception
	before_action :update_params, only: [:create, :update]
	def index
    @books = Book.includes(:authors)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book added!"
      redirect_to books_path
    else
      flash[:notice] = "Book can't be blank!"
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book updated!"
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    Book.destroy(params[:id])
    flash[:notice] = "Book removed!"
    redirect_to books_path
  end

  private

    def book_params
      params.require(:book).permit(:title, :author_ids => [])
    end

    def update_params
    	params[:book][:author_ids] = params[:book][:author_ids].reject { |e| e.to_s.empty? }
    end

end
