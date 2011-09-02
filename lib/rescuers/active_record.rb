module Errship
  module ActiveRecord
    module Rescuers
      def self.included(base)
        unless Rails.application.config.consider_all_requests_local
          base.rescue_from ::ActiveRecord::RecordNotFound, :with => :render_404_error
        end
      end
    end
  end
end