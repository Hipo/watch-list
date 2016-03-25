class UsersController < ApplicationController

	before_action :authenticate, except: [:authentication, :create]

	def new
	   @user = User.new
	end

	def list
		@users = User.all
		render json: @users
	end

	def authentication
		@user = User.find_by(email: params[:email])
		if @user
			encrypted_password = BCrypt::Engine.hash_secret(params[:password], @user.salt)
			if  encrypted_password == @user.encrypted_password
				render json: @user
			end
			# Todo failed login response will be returned.
		end
	end

	def create
		@user = User.new(user_params)
		@user.save!
		render json: @user, status: 201
	end

	def user_params
	  params.permit(:name, :email, :password)
	end

	protected
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      @authenticated_user=User.find_by(token: token)
    end
  end

end
