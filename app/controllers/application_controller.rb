class ApplicationController < ActionController::Base
  # sama kaya construct kayanya
  before_action :set_current_user

  # global variable maybe
  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end
end
