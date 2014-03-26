Distracker::Application.routes.draw do
  resources :seshes do 
    resources :distractions
  end
  devise_for :users do get '/users/sign_out' => 'devise/sessions#destroy' end

  root 'pages#home'
end
