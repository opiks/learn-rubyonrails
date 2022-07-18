class PasswordResetsController < ApplicationController
  def index
  end

  def store
    @user = User.find_by(email: params[:email])

    if @user.present?
      # send email manggil nya namamailer.with(datanya).namafunction.namadeliver
      # namadeliver :
      # deliver_later buatngirim sedikit telat tapi dia bakal ngirim di background
      # deliver_now buatngirim email sekarang
      @token = @user.signed_id(purpose: "password_reset", expires_in: 15.minutes)
      PasswordMailer.with(user: @user, token: @token).reset.deliver_now
      redirect_to home_path, flash: { :message => "We have sent a link to reset your password in email", :type => "success" }
    else
      flash[:message] = "Email is invalid"
      flash[:type] = "danger"
      render :index
    end
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSuppor::MessageVerifier::InvalidSignature
    redirect_to home_path, flash: { :message => "Your token has expired", :type => "success" }
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to login_path, flash: { :message => "Your password has reset successfully", :type => "success" }
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
