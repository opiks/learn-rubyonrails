class RegistrationController < ApplicationController
  def new
    @user = User.new
  end

  def store
    # kaya dd di laravel
    # render plain: params[:user]
    # params kaya $_POST di php
    @user = User.new(user_params)
    if @user.save
      # set session
      session[:user_id] = @user.id
      redirect_to home_path, flash: { :message => "Successfully created account", :type => "success" }
    else
      # ini render ke registration new
      render :new
    end
  end

  private
  def user_params
    # form validation
    params.required(:user).permit(:email, :name, :password, :password_confirmation)
  end
end
