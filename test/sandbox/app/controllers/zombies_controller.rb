class ZombiesController < ApplicationController
  include Errship::Mongoid::Rescuers

  def index
    raise Mongoid::Errors::DocumentNotFound
  end
end
