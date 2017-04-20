Rails.application.routes.draw do
  get "our-offer", to: "pages#our_offer"
  get "about-us", to: "pages#about_us"
  root "pages#home"
end
