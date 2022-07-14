class MainController < ApplicationController
  def index
    flash.now[:message] = "Berhasil Masuk"
    flash.now[:type] = "success"
  end
end
