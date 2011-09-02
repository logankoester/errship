require 'errship'

class ApplicationController < ActionController::Base
  include Errship::Rescuers
  include Errship::ActiveRecord::Rescuers
  protect_from_forgery

  def try_flashback
    self.flashback(params[:message])
  end
end
