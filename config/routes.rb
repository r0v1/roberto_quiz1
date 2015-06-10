Rails.application.routes.draw do


  root 'supports#index'

  post "/supports/status/:id" => "supports#status", as: :status_support

  resources :supports
end
