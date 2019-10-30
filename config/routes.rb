Rails.application.routes.draw do
  resources :interpreter_languages
  resources :dialects
  resources :languages
  devise_for :interpreters, :controllers => { registrations: 'interpreters/registrations' }
  resources :interpreters
  resources :addresses
  root to: "homes#index"
end
