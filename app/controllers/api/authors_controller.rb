class Api::AuthorsController < ApplicationController
	def index
    @authors = Author.includes(:books)
    render json: @authors, adapter: :json
  end

  def show
  	@author = Author.find(params[:id])
  	render json: @author, adapter: :json
  end
end
