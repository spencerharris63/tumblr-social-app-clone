Rails.application.routes.draw do
  resources :posts do
    collection do
      get 'new'
      get 'new_text_post'
      get 'new_image_post'
      post 'create_text_post'
      post 'create_image_post'
      get 'all_posts'
    end
    resources :comments, only: [:create]
  end

  resources :text_posts, only: [:show]
  resources :image_posts, only: [:show]

  resources :users do
    member do
      post 'follow'
      post 'unfollow'
    end
  end
  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'all_posts', to: 'posts#all_posts', as: 'all_posts'

  root 'posts#index'
end