class SessionsController < ApplicationController
  def login
  end

  def store
    # render plain: params
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, flash: { :message => "Logged in", :type => "success" }
    else
      flash[:message] = "Invalid email or password"
      flash[:type] = "danger"
      render :login
    end
  end

  def destroy
    # set session
    session[:user_id] = nil
    redirect_to home_path, flash: { :message => "Logged out", :type => "success" }
  end
end
