class ZombiesController < ApplicationController
  include Errship::Mongoid::Rescuers

  def index
    raise Mongoid::Errors::DocumentNotFound.new(User, 1)
  end
end
