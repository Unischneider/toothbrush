class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @user = current_user
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    if @user.update(set_params)
    else
      render :edit
    end
    authorize @user
  end

  private

  def set_params
    params.require(:user).permit(:first_name, :last_name, :address, :gender)
  end
end
