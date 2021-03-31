Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    # post '/duties', to: 'duties#to_bring', as: :to_bring
  resources :items
  resources :trips do
    resources :invitations, only: [:new, :create]
    resources :checklist_items, only: [:new, :create]
    resources :labels do
      post '/checklist_items', to: 'checklist_items#import', as: :import
    end
  end
  # Circle-plus actions.
  post 'duties/to_bring', to: 'duties#claim', as: :claim

  resources :checklist_items, only: [:edit, :update, :destroy]
  resources :invitations, only: [:update]
  post '/invitation/:id', to: 'invitation#accept', as: :accept
  resources :trips, only: [:new, :edit, :update]
end
