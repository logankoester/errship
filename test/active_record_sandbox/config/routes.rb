Sandbox::Application.routes.draw do
  match '/try_flashback', :controller => 'application', :action => 'try_flashback'
  match '/brains', :controller => 'brains', :action => 'index'
end
