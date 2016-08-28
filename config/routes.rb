Rails.application.routes.draw do
 
  devise_for :users
  root 'welcome#index'
  get 'profile/index'
  
  namespace :admin do
    get 'dash_board/index'
  end 

  resources :books do    
    patch :publish, on: :member
    patch :draft, on: :member
  end
end
