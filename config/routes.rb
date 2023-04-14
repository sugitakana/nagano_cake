Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    get 'customers/mypage' => 'customers#show'
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw', as: 'confirm_withdraw'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :customers, only:[:edit, :update]
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :create, :update, :destroy] do
       collection do
        delete "destroy_all"
      end
    end
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:show, :index, :new, :create, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :edit, :update, :show]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
 end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
