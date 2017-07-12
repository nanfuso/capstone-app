Rails.application.routes.draw do

    get '/home' => 'employees#home'
    get '/signup' => 'employees#new'
    post '/signup' => 'employees#create'

    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

    get '/shifts' => 'shifts#index'
    post '/shifts' => 'shifts#create'
    get '/shifts/:id' => 'shifts#show'
    get 'shifts/:id/edit' => 'shifts#edit'
    patch '/shifts/:id' => 'shifts#update'
    delete '/shifts/:id' => 'shifts#destroy'

    get '/positions' => 'positions#index'
    post '/positions' => 'positions#create'
    get '/positions/:id/edit' => 'positions#edit'
    patch '/positions/:id' => 'positions#update'
    delete '/positions/:id' => 'positions#delete'

    get '/' => 'position_shifts#index'
    post '/positionshifts' => 'position_shifts#create'
    get '/positionshifts/:id/edit' => 'position_shifts#edit'
    patch '/positionshifts/:id' => 'position_shifts#update'
    delete '/positionshifts/:id' => 'position_shifts#delete'

    get '/companies/new' => 'companies#new'
    post '/companies' => 'companies#create'
    get '/companies/:id' => 'companies#show'
    get '/companies/:id/edit' => 'companies#edit'
    patch 'companies/:id' => 'companies#update'
    delete '/companies/:id' => 'companies#destroy'

    get '/companycategories' => 'company_categories#index'
    post '/companycategories' => 'company_categories#create'

end
