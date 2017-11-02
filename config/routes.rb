Rails.application.routes.draw do
  root 'cars#index'
  get 'cars/create'=> 'cars#create'
  get 'cars/index'=> 'cars#index'
end
