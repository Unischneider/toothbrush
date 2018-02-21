class UsersController < ApplicationController
  def show
    @user = current_user if user_signed_in?
  end

  def edit
  end

  def update
  end
end
