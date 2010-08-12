ActionController::Routing::Routes.draw do |map|
  map.root :controller => "pages"
  map.resources :posts, :member => { :add_tag => :get }

  map.connect "/pages/:action", :controller => "pages"
end
