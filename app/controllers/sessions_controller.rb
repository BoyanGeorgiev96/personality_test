class SessionsController < ApplicationController
  def create
    user = current_user || User.create!
    session[:current_user_id] = user.id
  end
end
