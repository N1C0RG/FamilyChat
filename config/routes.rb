Rails.application.routes.draw do
  get 'group/index', to: 'group#index', as: 'search_group'
  get 'group/:id/new', to: 'group#new', as: 'new_group' 
  post 'group/create', to: 'group#create', as: 'create_group' 
  get 'group/edit'
  get 'group/update'
  get 'group/:id/join', to: 'group#join', as: 'join_group'
  devise_for :users
  get 'home/index', as: 'home'
  root 'home#index'

  #problema al cerrar la sesion con devise 
  devise_scope :user do 
    get 'users/sign_out' => "devise/sessions#destroy"
  end 
end
