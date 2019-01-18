Rails.application.routes.draw do
  devise_for :users

  resources :food_category do
    resources :recipes do
      match :vote, via: [:post, :delete], on: :member
    end
  end

  root 'static_pages#home'

  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/toprated', to: 'recipes#toprated'
end
