Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/descriptor', to: 'descriptor#show', defaults: { format: :json }
  post '/installed', to: 'lifecycle#installed'
  post '/uninstalled', to: 'lifecycle#uninstalled'
  get '/stars', to: 'stars#show'
  put '/stars', to: 'stars#save'

  get '/configure', to: 'configure#show'
  put '/configure', to: 'configure#save'

  post '/callback', to: 'callback#handle'

  resources :project_configurations, only: [:edit, :update], param: :project_id

end
