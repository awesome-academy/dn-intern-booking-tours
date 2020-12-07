Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "tour_pages#home"
  end
end
