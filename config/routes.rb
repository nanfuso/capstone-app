Rails.application.routes.draw do
    get '/' => 'employees#index'
    get '/signup' => 'employees#new'
    post '/signup' => 'employees#create'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

    get '/shifts' => 'shifts#index'
    post '/shifts' => 'shifts#create'

end
