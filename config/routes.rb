Rails.application.routes.draw do
  get "contact", to: "pages#contact"
  get "our-offer", to: "pages#our_offer"
  get "about-us", to: "pages#about_us"
  root "pages#home"
end
