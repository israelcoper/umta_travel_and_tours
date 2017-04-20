Rails.application.routes.draw do
  get "about-us", to: "home#about_us"
  root "home#index"
end
