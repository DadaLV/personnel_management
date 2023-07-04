Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employees
      resources :departments
    end
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :employees do
    resources :employee_positions, only: [:new, :create, :edit, :update], as: 'positions'
  end

  get '/employees/:id/positions', to: 'employee_positions#index', as: 'employee_positions_index'

  resources :positions
  resources :departments
  resources :vacations, only: [:index]

  get '/employees/:employee_id/employee_positions', to: redirect('/employees/%{employee_id}/positions')
  get '/employees/:employee_id/employee_positions/new', to: redirect('/employees/%{employee_id}/positions/new')
end