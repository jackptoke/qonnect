Rails.application.routes.draw do
  devise_for :interpreters, :controllers => { registrations: 'interpreters/registrations' }
  resources :interpreters
  resources :addresses
  root to: "homes#index"
  get "my_languages", to: "interpreter_languages#my_languages", as: "my_languages"

  resources :interpreter_languages
  resources :languages
  resources :dialects
end
