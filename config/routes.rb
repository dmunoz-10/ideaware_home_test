Rails.application.routes.draw do
  devise_for :users

  scope '/images' do
    get '/search', to: 'images#search', as: :search_images
    post '/favourite', to: 'images#favourite', as: :favourite_image
    get '/favourites', to: 'images#favourites', as: :favourite_images
  end

  root to: 'pages#home'
end
