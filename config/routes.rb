FootballBet::Application.routes.draw do

root :to => 'sessions#new'

resources :users do
  member do
    get :games
    get :wagers
  end
end

resources :bank
resources :wagers
resources :games
resources :sessions, only: [:new, :create, :destroy]

match "/auth/:provider/callback" => "sessions#create"

match '/signup' => 'users#new'
match '/signin' => 'sessions#new'
match '/signout' => 'sessions#destroy'
post '/open_game' => 'users#open_game'
post '/pre_game' => 'games#create_pregame_questions'
get '/admin' => 'users#index'

end
