Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/filing' => 'records#create'

  get '/retrieve' => 'records#retrieve'

  post '/update_tag' => 'records#update_tag'

end
