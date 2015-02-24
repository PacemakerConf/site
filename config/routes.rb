Rails.application.routes.draw do

  resources :reports

  get 'report/report'

  namespace :admin do
  get 'event/index'
  end

  root 'conferences#show', name: Conference.last_conference

  devise_for :admins, skip: :sessions
  as :admin do
    get 'login', to: 'devise/sessions#new', as: :new_admin_session
    post 'login', to: 'devise/sessions#create', as: :admin_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_admin_session
  end
  
  namespace :admin do
    root 'conferences#index'
    resources :conferences, param: :name do
      member do
        get 'schedule'
      end
    end
    resources :contacts
    resources :events
    resources :event_types 
    resources :locations  
    resources :speakers, param: :name do
      collection do
        get 'invite', to: 'speakers#invite'
        post 'send', to: 'speakers#send_invitation'
      end
    end 
  end

  resources :speakers, param: :name
  resources :events
  resources :conferences, param: :name
  resources :years

  get ':name', to: 'conferences#show'
  get ':name/about', to: 'conferences#show', as: :about_conference
  get ':name/speakers', to: 'conferences#speakers', as: :speakers_conference
  get ':name/location', to: 'conferences#location', as: :location_conference
  get ':name/schedule', to: 'conferences#schedule', as: :schedule_conference

end 
