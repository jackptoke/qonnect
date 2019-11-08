Rails.application.routes.draw do
  resources :booked_interpreters
  get "pastbookings", to: "job_bookings#past_bookings"
  get "available_jobs", to: "job_bookings#available"
  get "myinterpreter/:interpreter_id", to: "job_bookings#myinterpreter", as: "myinterpreter"
  patch 'job_bookings/:id/cancel' => 'job_bookings#cancel', as: :booking_cancel

  get 'interpreter_past_bookings', to: 'booked_interpreters#past'
  post 'booked_interpreters/remark/' => 'booked_interpreters#remark', as: :interpreter_remark
  post 'available_interpreters/addme/' => 'available_interpreters#addme', as: :addme_available_interpreter
  post 'booked_interpreters/book/' => 'booked_interpreters#book', as: :book_an_interpreter
  patch 'booked_interpreters/:id/arrived' => 'booked_interpreters#arrived', as: :interpreter_arrived
  patch 'booked_interpreters/:id/started' => 'booked_interpreters#started', as: :interpreter_started
  patch 'booked_interpreters/:id/finished' => 'booked_interpreters#finished', as: :interpreter_finished
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
  get "/homes/no_page", to: "homes#no_page"
  get "my_languages", to: "interpreter_languages#my_languages", as: "my_languages"

  post "/payments/webhook", to: "payments#webhook"
  get "/payments/success", to: "payments#success"

  resources :interpreter_languages
  resources :languages
  resources :dialects
  resources :locations
  resources :available_interpreters

  # get '*path', to: "homes#no_page", :flash => { :error => "Page doesn't exist!" }
end
