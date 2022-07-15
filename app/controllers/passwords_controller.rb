class PasswordsController < ApplicationController
  before_action :check_user_login

  def edit
  end

  def update
    # render plain: params
    if Current.user.update(password_params)
      redirect_to home_path, flash: { :message => "Successfully change password", :type => "success" }
    else
        render :edit
    end
  end

  private

  def password_params
    # form validation
    params.required(:user).permit(:old_passowrd, :password, :password_confirmation)
  end
end
