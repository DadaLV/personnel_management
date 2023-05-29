Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :employees do
    resources :employee_positions, only: [:new, :create, :edit, :update]
  end
  
  resources :positions
  resources :departments
  resources :employee_positions
  
end
