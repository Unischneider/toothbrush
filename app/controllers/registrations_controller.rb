class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :email, :address, :password, :password_confirmation)
  end

end
