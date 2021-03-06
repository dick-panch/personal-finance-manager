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
  get 'existCategory' => 'api/categories#existCategory'
  get 'getTransactionDescription' => 'api/transactions#get_transaction_description'

  ## After Login
  get '/dashboard' => 'dashboard#index', as: :dashboard

  ## Normal User Routes ------------------------------------------------
  resources :categories
  resources :transactions do
    collection do
      get :monthly_expenses, path: 'monthly-expenses'
      get :monthly_incomes, path: 'monthly-incomes'
      get :monthly_investments, path: 'monthly-investments'

      get :yearly_expenses, path: 'yearly-expenses'
      get :yearly_incomes, path: 'yearly-incomes'
      get :yearly_investments, path: 'yearly-investments'

      post :import
    end
  end

  resources :accounts, only: [] do
    collection do
      get :profit_and_loss, path: 'profit-and-loss'
      get :balance_sheet, path: 'balance-sheet'
    end
  end

  resources :users, only: [:edit, :update]
  resources :reports, only: [:index] do
  end

  resources :balances, only: [:index]
  resources :calendars, only: [:index], path: 'calendar'
  get '/calendar/fetch-all-transactions' => 'calendars#fetchAllTransactions'
  
  resources :budgets

  ## Admin Routes ------------------------------------------------------
  namespace :admin do
    resources :categories
  end

end
