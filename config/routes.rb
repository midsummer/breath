Rails.application.routes.draw do
  resources :sighs

  root 'sighs#new'

end
