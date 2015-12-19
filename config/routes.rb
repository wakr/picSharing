Rails.application.routes.draw do
  resources :pictures
  resources :comments
  root 'pictures#index'
  post '/pictures' => 'pictures#upload_image'
end
