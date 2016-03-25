class Movie < ActiveRecord::Base
	has_many :user_movie_action
	has_many :user, through: :user_movie_action
end
