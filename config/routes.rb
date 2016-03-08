Rails.application.routes.draw do
    root :to => 'events#index'
    resources :user_sessions
    resources :users

    get 'events/:id/edit' => "events#edit", as: "edit_event"
    patch 'events/:id' => "events#update"
    
    get '/events/archived' => 'events#archived'
    get '/events/info' => 'events#info'
    get '/engagements/saved' => 'engagements#saved'
    resources :events do
      resources :engagements, only: [:create, :destroy]
    end

    namespace :admin do
        resources :users, :events
    end

    get 'login' => 'user_sessions#new', :as => :login
    post 'logout' => 'user_sessions#destroy', :as => :logout

end