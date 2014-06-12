class PagesController < ApplicationController

	def index
		create_params
		render :show
	end

  	def new
  		@book = Book.find( params[:book_id] )
  		@page = @book.pages.new
	end

	def show
		create_params
	end

	def create
		@page = Page.new(pages_params)
        if @page.save
            redirect_to book_pages_path(params[:book_id]), :flash => { :notice => " Page Created!" }
        else
          redirect_to :new
        end
	end

	private
	def pages_params
		params.require(:page).permit(:chapter, :number, :book_id)
	end

	def create_params
		@book = Book.find( params[:book_id] )
		@pages = @book.pages.all
	end
end
