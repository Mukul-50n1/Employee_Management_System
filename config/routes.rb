Rails.application.routes.draw do
  devise_for :employers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "employees#index"
  resources :employers
  resources :employees
  get "search" ,to: "employees#search"
  get "adda.(:id)" ,to: "employees#adda"
end
