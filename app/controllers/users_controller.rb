class UsersController < ApplicationController
  def show
    @user = current_user if user_signed_in?
  end

  def edit
    @user = User.new(set_params)
  end

  def update
  end

  private

  def set_params
    params.require(:user).permit(:first_name, :last_name, :address, :gender)
  end
end
