Rails.application.routes.draw do
  resources :booked_interpreters
  get "pastbookings", to: "job_bookings#past_bookings"
  get "available_jobs", to: "job_bookings#available"
  get "myinterpreter/:interpreter_id", to: "job_bookings#myinterpreter", as: "myinterpreter"
  post 'available_interpreters/addme/' => 'available_interpreters#addme', as: :addme_available_interpreter
  post 'booked_interpreters/book/' => 'booked_interpreters#book', as: :book_an_interpreter
  patch 'job_bookings/:id/cancel' => 'job_bookings#cancel', as: :booking_cancel
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
  resources :available_interpreters
end
