Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "tour_pages#home"
    get "/login", to: "sessions#new"
    delete "/logout", to: "sessions#destroy"
    resources :bookings, only: [:show, :create]
  end
end
