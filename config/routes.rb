Rails.application.routes.draw do
 
  devise_for :users
  root 'welcome#index'

  get 'profile/index'
  namespace :admin do
    get 'dash_board/index'
  end 
end
