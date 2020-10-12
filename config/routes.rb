Rails.application.routes.draw do
  devise_for :users

  scope '/images' do
    get '/search', to: 'images#search', as: :search_images
    post '/favourite/:url', to: 'images#favourite', as: :favourite_image
    delete '/unfavourite/:id', to: 'images#unfavourite', as: :unfavourite_image
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
