Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
  resources :employees do
    resources :employee_positions, only: [:new, :create]
  end
  get 'department_employees', to: 'employees#department_employees'
  resources :positions
  resources :departments, only: [:index]
  
end
