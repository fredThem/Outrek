Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items
  resources :trips do
    resources :invitations, only: [:new, :create]
    resources :labels do
      resources :checklist_items, only: [:create]
    end
  end
  resources :invitations, only: [:update]
  post '/invitation/:id', to: 'invitation#accept', as: :accept
  resources :trips, only: [:new, :edit, :update]
end
