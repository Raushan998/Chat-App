# frozen_string_literal: true

# Session Controller for handling login, logout flow.
class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params.dig(:session, :username))
    if user
      login(user)
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
