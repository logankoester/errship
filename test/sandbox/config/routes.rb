Sandbox::Application.routes.draw do
  match '/try_flashback', :controller => 'application', :action => 'try_flashback'
  match '/brains', :controller => 'brains', :action => 'index'
  match '/zombies', :controller => 'zombies', :action => 'index'
  match '/humans', :controller => 'humans', :action => 'index'
end
