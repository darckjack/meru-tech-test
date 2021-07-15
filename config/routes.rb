Rails.application.routes.draw do
  resources :games do
    get '/cells/:row/:col', to: 'cells#show'
    match '/cells/:row/:col', to: 'cells#update', via: [:put, :patch]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
