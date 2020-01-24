Rails.application.routes.draw do
  
  get 'purchase/index'

  get 'purchase/done'

  get 'card/new'

  get 'card/show'

  devise_for :users,controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  
  root "items#index"
  resources :items do
    collection do
      get :confirmation
    end
  end
  
  resources :users, only: [:edit, :update, :delete, :create, :show] do
    member do
      get :profile
      get :card_registration
      get :user_info_register
      get :user_page
      get :logout
    end
  end

  resources :signup, only: [ :create] do
    collection do
      post "signup"
      get "signup2"
      get "signup3"
      get "signup4"
      get "signup5"
      get "done"
      post "done"
    end
  end

  resources :card, only: [:new, :show, :edit, :update, :destroy] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end


  

end

