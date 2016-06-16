Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  resources :users
  resources :products do 
    resources :comments 
  end
  
  get 'static_pages/about'

  get 'static_pages/contact'
  get 'static_pages/index'

  post 'static_pages/thanks'

  # Root page
  root 'static_pages#index'

  resources :orders, only: [:index, :show, :create, :destroy]
end
