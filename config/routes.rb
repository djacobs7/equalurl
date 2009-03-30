ActionController::Routing::Routes.draw do |map|
  map.connect 'not_found', :controller => 'site', :action => 'not_found'
  map.connect 'new_link', :controller => 'site', :action => 'create_new_link'
  map.connect 'too_short', :controller => 'site', :action => 'too_short'
  map.connect 'show/:key', :controller => 'site', :action => 'show'
  map.connect 'mwt', :controller => 'site', :action => 'rickroll'
  map.connect ':key', :controller => 'site', :action => 'redirect_to_link' 
end
