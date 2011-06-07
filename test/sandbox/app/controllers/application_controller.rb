class ApplicationController < ActionController::Base
  include Errship::Rescuers
  protect_from_forgery
end
