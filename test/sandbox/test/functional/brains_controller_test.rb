require 'test_helper'

class BrainsControllerTest < ActionController::TestCase
  test "/error routes to errship's standard error page with ActiveRecord::RecordNotFound" do
    Errship::Rescuers.expects(:render_404_error).with(ActiveRecord::RecordNotFound, anything)
    
    get :index
  end
end
