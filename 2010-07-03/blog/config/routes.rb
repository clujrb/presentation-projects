ActionController::Routing::Routes.draw do |map|
  map.root :controller => "posts" #, :action => "index"
  map.resources :posts
end
