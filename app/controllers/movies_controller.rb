class MoviesController < ApplicationController
	protect_from_forgery with: :null_session
	before_action :authenticate, except: [:show, :list]

	def list
		@movies = Movie.all
		render json: @movies
	end

	def show
		movie = Movie.find(params["id"])
		render json: movie
	end


	def create_action
		movie = Movie.find(params["id"])
		user_movie_action = UserMovieAction.first_or_create(user: @authenticated_user, movie: movie)
		user_movie_action.action_type=params[:action_type]
		user_movie_action.save
		render json: user_movie_action
	end


	protected
	def authenticate
		authenticate_or_request_with_http_token do |token, options|
		  @authenticated_user=User.find_by(token: token)
		end
	end
end
