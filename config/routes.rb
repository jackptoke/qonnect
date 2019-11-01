Rails.application.routes.draw do
  resources :job_bookings
  devise_for :clients, path: 'clients', controllers: {
    sessions: 'clients/sessions', registrations: 'clients/registrations' 
  }
  devise_for :interpreters, path: 'interpreters', controllers: { 
    sessions: 'clients/sessions', registrations: 'interpreters/registrations'
  }
  # devise_for :clients
  resources :interpreters
  resources :addresses
  root to: "homes#index"
  get "my_languages", to: "interpreter_languages#my_languages", as: "my_languages"

  resources :interpreter_languages
  resources :languages
  resources :dialects
  resources :locations
end
