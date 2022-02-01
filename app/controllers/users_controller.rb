class UsersController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :no_user_found
  def show
    user = User.find_by(id: params[:id])
    render json: user, include: :items, status: :ok
  end

  def no_user_found 
    render json: {error: "No user found"}, status: :not_found
  end

end
