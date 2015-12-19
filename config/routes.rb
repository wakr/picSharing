Rails.application.routes.draw do
  resources :pictures
  root 'pictures#index'
  post '/pictures' => 'pictures#upload_image'
end
