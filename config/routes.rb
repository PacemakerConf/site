Rails.application.routes.draw do

  root 'conferences#show', name: Conference.last_conf

  resources :conferences, param: :name
  
  get ':name/about', to: 'conferences#show', as: :about_conference
  get ':name/speakers', to: 'conferences#speakers', as: :speakers_conference
  get ':name/location', to: 'conferences#location', as: :location_conference



  devise_for :admins, 
    :path => "", :path_names => {:sign_in => 'login', :sign_out => 'logout'} 


    resources :speakers, param: :name do
      collection do
        get 'invite', to: 'speakers#invite'
      end
    end 
    resources :contacts
    resources :locations  
    resources :event_types

end
