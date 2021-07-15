Rails.application.routes.draw do
  resources :games, constraints: { id: /[0-9]+/ }, only: [:index, :show, :create] do
    get '/cells/:row/:col', to: 'cells#show'
    match '/cells/:row/:col', to: 'cells#update', via: [:put, :patch]
  end
  get '/games/finished', to: 'games#finished'
  get '/games/in-progress', to: 'games#in_progress'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
