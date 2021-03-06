ActionController::Routing::Routes.draw do |map|
  map.resources :people
  
  map.resources :users do |u|
    u.resources :feeds, :member => { :titles => :get }
  end
  
  map.resource :user_session
  
  map.resource :account, :controller => "users"
  
  map.root :controller => "feeds"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
