class HumansController < ApplicationController
  include Errship::MongoMapper::Rescuers

  def index
    raise MongoMapper::DocumentNotFound
  end
end
