Rails.application.routes.draw do
  namespace :admin do
    resources :offers
  end

  get "contact", to: "pages#contact"
  get "our-offer", to: "pages#our_offer"
  get "about-us", to: "pages#about_us"
  root "pages#home"
end
