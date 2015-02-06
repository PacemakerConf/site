Rails.application.routes.draw do

root 'conferences#show', name: Conference.last_conference

  resources :conferences, param: :name

  get ':name/about', to: 'conferences#show', as: :about_conference
  get ':name/speakers', to: 'conferences#speakers', as: :speakers_conference
  get ':name/location', to: 'conferences#location', as: :location_conference

  #get 'location/new', to: 'location#new', name: Conference.name
  #get 'location/new/:name' , to: 'location#new' , as: :new_location

  devise_for :admins, :skip => [:sessions]
    as :admin do
      get 'login' => 'devise/sessions#new', :as => :new_admin_session
      post 'login' => 'devise/sessions#create', :as => :admin_session
      delete 'logout' => 'devise/sessions#destroy', :as => :destroy_admin_session 
    end

  resources :speakers, param: :name do
    collection do
      get 'invite', to: 'speakers#invite'
    end
  end 

  resources :contacts
  resources :locations  
  resources :event_types

end
