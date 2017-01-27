class MoviesController < ApplicationController
	
	def index
	   if params[:search]
	     @movies = Movie.where("title LIKE ?", "%#{params[:search]}%")
	   else 
	     @movies = Movie.order(params[:sort])

	   end
	end
	
	def show
		@movie = Movie.find(params[:id])
	end
	
	def new
		@movie = Movie.new
	end
	
	def edit
		@movie = Movie.find(params[:id])
	end
	
	def create
		@movie = Movie.new(movie_params)
		
		@movie.save
		redirect_to @movie
	end
	
	def update
		@movie = Movie.find(params[:id])
		
		if @movie.update(movie_params)
			redirect_to @movie
		else
			render 'edit'
		end
	end
	
	def destroy 
		@movie = Movie.find(params[:id])
		@movie.destroy
		
		redirect_to movies_path
	end
	
	private
		def movie_params
			params.require(:movie).permit(:title, :year, :runtime, 
			:director, :description, :netflix, :hulu, :amazon)
	end
	
	def sort_column
		Product.column
	end
	
	
	
	
	
	
	
	
	
	
	
end
