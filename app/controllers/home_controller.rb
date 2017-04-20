class HomeController < ApplicationController
  def index
    render layout: "home"
  end

  def about_us
    render layout: "application"
  end
end
