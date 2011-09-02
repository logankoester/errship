module Errship
  module Mongoid
    module Rescuers
      def self.included(base)
        unless Rails.application.config.consider_all_requests_local
          base.rescue_from ::Mongoid::Errors::DocumentNotFound, :with => :render_404_error
        end
      end
    end
  end
end