Rails.application.routes.draw do
  scope "(:locale)", locale: /en|uk/ do
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
end