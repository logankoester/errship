module Errship
  module MongoMapper
    module Rescuers
      def self.included(base)
        unless Rails.application.config.consider_all_requests_local
          base.rescue_from ::MongoMapper::DocumentNotFound, :with => :render_404_error
        end
      end
    end
  end
end