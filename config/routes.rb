Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  devise_for :users, controllers: { 
  	sessions: 'users/sessions',
  	registrations: 'users/registrations',
  	passwords: 'users/passwords',
  	confirmations: 'users/confirmations'
  }

  get 'existUsername' => 'api/users#existUsername'
  get 'existEmail' => 'api/users#existEmail'
  get 'notExistEmail' => 'api/users#notExistEmail'

  ## After Login
  get '/dashboard' => 'dashboard#index', as: :dashboard
end
