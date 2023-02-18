# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def current_user
    @@current_user = set_user
  end
  def current_user_information
    @@current_user_information = @@current_user.user_information
  end

  private

  def authenticate_user!
    if request.authorization
      user = set_user
      return render json: { errors: "Invalid token" }, status: :unauthorized unless user
      user
    else
      render json: { message: "No authorization Header sent" }, status: :forbidden
    end
  end

  def set_user
    User.find_by(token: request.authorization)
  end
end
