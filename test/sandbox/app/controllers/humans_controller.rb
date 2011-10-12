class HumansController < ApplicationController
  include Errship::MongoMapper::Rescuers

  def index
    raise MongoMapper::DocumentNotFound.new
  end
end
