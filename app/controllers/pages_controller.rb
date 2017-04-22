class PagesController < ApplicationController
  layout "application"

  def home
    @featured_offers = Offer.featured
    render layout: "home"
  end

  def about_us
  end

  def our_offer
  end

  def contact
  end
end
