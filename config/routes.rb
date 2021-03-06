Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'user/registrations' }
  resources :user_stocks, except: [:show, :edit, :update]

  get 'welcome/index'
  root 'welcome#index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'

  get 'friends', to: 'users#my_friends'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
