Rails.application.routes.draw do

  get '/', to: redirect(Conference.last_conference_route) if ActiveRecord::Base.connection.table_exists?('conferences')

  match 'send_mail', to: 'speaker_request#send_mail', via: 'post'

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
      member do
        patch 'publish'
      end
    end
    resources :contacts
    resources :events do
      collection do
        get 'position'
      end
      member do 
        get 'position'
      end
      member do
        patch 'publish'
      end
    end
    resources :event_types 
    resources :locations
    resources :reports 
    resources :invitations 
    resources :speakers do
      collection do
        get 'invite', to: 'speakers#invite'
        #get 'list', to: 'speakers#list'
        post 'send', to: 'speakers#send_invitation'
      end
    end 
    resources :years do
      member do
        patch 'publish'
      end
    end
    resources :messages  do
      member do 
        get 'switch_to', to: 'messages#switch_to'
      end
    end
    resources :news
  end
  

  #userside 
  resources :speakers
  resources :conferences, param: :name
  resources :events
  resources :years, param: :name, only: :show

  get ':name', to: 'conferences#show'
  get ':name/about', to: 'conferences#show', as: :about_conference
  get ':name/speakers', to: 'conferences#speakers', as: :speakers_conference
  get ':name/location', to: 'conferences#location', as: :location_conference
  get ':name/schedule', to: 'conferences#schedule', as: :schedule_conference
  get ':name/report', to: 'conferences#report', as: :report_conference

end