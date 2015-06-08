Rails.application.routes.draw do
  root 'supports#index'

  resources :supports

end
