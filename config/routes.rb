Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :items
  resources :trips do
    resources :invitations, only: [:new, :create]
    resources :checklist_items, only: [:new, :create, :edit, :destroy]
    resources :labels do
      post '/checklist_items', to: 'checklist_items#import', as: :import
    end
  end
  resources :invitations, only: [:update]
  post '/invitation/:id', to: 'invitation#accept', as: :accept
  resources :trips, only: [:new, :edit, :update]
end
