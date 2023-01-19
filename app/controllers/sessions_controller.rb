class SessionsController < ApplicationController
  def create
    user = current_user || User.create!
    session[:current_user_id] = user.id
    render json: { logged_in: true, user_id: session[:current_user_id] }
  end
end
