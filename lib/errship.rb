require 'haml'

module Errship
  class Engine < ::Rails::Engine
    paths.app.routes = 'config/routes.rb'
    paths.app.views = 'app/views'
  end

  module Rescuers
    def self.included(base)
      unless Rails.application.config.consider_all_requests_local
        base.rescue_from Exception, :with => :render_error
        base.rescue_from ActiveRecord::RecordNotFound, :with => :render_404_error
        base.rescue_from ActionController::RoutingError, :with => :render_404_error
        base.rescue_from ActionController::UnknownController, :with => :render_404_error
        base.rescue_from ActionController::UnknownAction, :with => :render_404_error
      end
    end

    def render_error(exception)
      HoptoadNotifier.notify(exception) if defined?(HoptoadNotifier)

      @page_title = 'Internal Server Error'
      render :template => '/errship/standard', :locals => { :status_code => 500 }
    end

    def render_404_error(exception = nil)
      @page_title = 'Page Not Found'
      render :template => '/errship/standard', :locals => { :status_code => 404 }
    end

    # A blank page with just the layout and flash message, which can be redirected to when
    # all else fails.
    def errship_standard
      flash[:error] ||= 'An unknown error has occurred, or you have reached this page by mistake.'
      render :template => 'errship/standard', :locals => { :status_code => 500 }
    end

    # Set the error flash and attempt to redirect back. If RedirectBackError is raised,
    # redirect to error_path instead.
    def flashback(error_message, exception = nil)
      HoptoadNotifier.notify(exception) if defined?(HoptoadNotifier) && exception
      flash[:error] = error_message
      begin
        redirect_to :back
      rescue ActionController::RedirectBackError
        redirect_to error_path
      end
    end

  end
end
