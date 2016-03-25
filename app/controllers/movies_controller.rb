class MoviesController < ApplicationController
	protect_from_forgery :except => :create
	def list
		@movies = Movie.all
		render json: @movies
	end
end
