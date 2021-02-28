class AuthorsController < ApplicationController
	protect_from_forgery with: :exception
	def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author added!"
      redirect_to authors_path
    else
      flash[:notice] = "Author can't be blank!"
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:notice] = "Author updated!"
      redirect_to authors_path
    else
      render :edit
    end
  end

  def destroy
    Author.destroy(params[:id])
    flash[:notice] = "Author removed!"
    redirect_to authors_path
  end

  private

    def author_params
      params.require(:author).permit(:first_name, :last_name, :dob)
    end
end
