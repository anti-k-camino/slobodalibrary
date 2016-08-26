Rails.application.routes.draw do
 
  devise_for :users
  root 'welcome#index'

  get 'profile/index'
  get 'dash_board/index'  
end
