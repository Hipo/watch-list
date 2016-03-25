class MoviesController < ApplicationController
	def list
		@movies = Movie.all
		render json: @movies
	end

	def show
		movie = Movie.find(@movie.id)
		render json: @movie
	end

end
