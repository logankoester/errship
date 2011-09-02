class BrainsController < ApplicationController
  def index
    raise ActiveRecord::RecordNotFound
  end
end
