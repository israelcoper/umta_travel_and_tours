class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def page
    params[:page] || 1
  end
end
