class ApplicationController < ActionController::API
	before_action :authenticate_user!

	def current_user
	  @@current_user ||= User.find_by(token: request.authorization)
	end		

	private

	def authenticate_user!
	  token = request.authorization
	  if token
      user = User.find_by(token: token)
      current_user
      unless user
	      render json: { errors: "Invalid token" }, status: :unauthorized
	    end
	  else
      render json: { message: "No authorization Header sent" }, status: :forbidden
	  end
	end

end
