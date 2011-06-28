if defined?(Rails::Application)
  Rails.application.routes.draw do
    # Unrecoverable error
    match '/error' => "application#errship_standard", :as => :error

    # Rails currently (until 3.1) ignores rescue_from ActionController::RoutingError, so render 404 manually
    match '*address' => 'application#render_404_error' unless Rails.application.config.consider_all_requests_local
  end
end