Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'pictures#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  resources :users
  resources :favo
  resources :pictures do
     collection do
      post 'confirm'
    end
  end
  
  get '/users/favo/:id', to:'users#favo'
 
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
