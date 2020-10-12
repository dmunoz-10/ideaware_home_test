Rails.application.routes.draw do
  devise_for :users

  scope '/images' do
    get '/search', to: 'images#search', as: :search_images
    post '/favorite', to: 'images#favorite', as: :favorite_image
    get '/favorites', to: 'images#favorites', as: :favorite_images
  end

  root to: 'pages#home'
end
