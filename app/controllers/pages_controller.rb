class PagesController < ApplicationController
  def home
    render layout: "home"
  end

  def about_us
    render layout: "application"
  end

  def our_offer
    render layout: "application"
  end
end
