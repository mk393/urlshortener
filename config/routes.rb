Rails.application.routes.draw do
    root 'pages#index'

    namespace :api do
        namespace :v1 do
            #resources :urls      
            post 'urls' => 'urls#create'
            put 'urls' => 'urls#update'
            patch  'urls' => 'urls#update'

        end
    end

    

    get '*path', to: 'pages#index', via: :all
end
