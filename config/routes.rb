Rails.application.routes.draw do
  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: "orders#index"
  resources :items, only: [:show, :index, :new, :create, :edit, :update]
  resources :genres, only:[:index, :create, :edit, :update]
  resources :customers, only:[:index, :edit, :update, :show]
  resources :orders, only:[:index, :show, :update]
  resources :order_details, only:[:update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
