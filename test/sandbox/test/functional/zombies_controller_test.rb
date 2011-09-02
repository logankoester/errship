require 'test_helper'

class ZombiesControllerTest < ActionController::TestCase
  test "/error routes to errship's standard error page" do
    Errship::Rescuers.expects(:render_404_error).with(Mongoid::Errors::DocumentNotFound, anything)
    
    get :index
  end
end
