Rails.application.routes.draw do
  root to: 'employers#index'
  devise_for :users
  #devise_for :employers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: "employees#index"
  resources :employers ,only: [] do
    collection do
      get :acco
      get :get_acco
      get :new
      post :create
    end
  end


  resources :employees ,except: [:show] do
    collection do    
      get "employees_destroy"
    end
  end
  resources :members
  resources :roles 
  resources :designations
  resources :addresses ,except: [:show]
  get "search" ,to: "employees#search"
  
  get "employees/address(/:id)" ,to: "employees#adda" ,as: 'adres'

  get "employees/grouping" ,to: "employees#grouping" 
  
end