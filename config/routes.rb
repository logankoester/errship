if defined?(Rails::Application)
  Rails.application.routes.draw do
    # Unrecoverable error
    match '/error' => "application#errship_standard", :as => :error, :via => :get
    match '/not_found' => "application#render_404_error", :as => 'not_found', :via => :get

    # Rails currently (until 3.1) ignores rescue_from ActionController::RoutingError, so render 404 manually
    unless Rails.application.config.consider_all_requests_local
      match '*address' => 'application#render_404_error', :via => :all, :constraints => lambda { |req|
        !req.path.starts_with?('/users/auth/')
      }
    end
  end
end
