require 'test_helper'

class ZombiesControllerTest < ActionController::TestCase
  test "/error routes to errship's standard error page with Mongoid::Errors::DocumentNotFound" do
    @controller.expects(:render_404_error).with(anything)
    
    get :index
  end
end
