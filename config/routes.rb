Rails.application.routes.draw do
  get '/users/login'
  post '/users/verify'
  get '/users/success_login', to: "users#success_login"
  root 'users#login'
  get '/employees',to: "employees#index"
  post '/employees',to: "employees#create"
  get '/employees/:id',to: "employees#show"
  get '/search/employee', to: "employees#search"
  get 'search_employee/employees', to: "employees#search_employee"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
