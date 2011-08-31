class BrainsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => ->(e){ render_404_error e, 'brainless' }

  def index
    raise ActiveRecord::RecordNotFound
  end
end
