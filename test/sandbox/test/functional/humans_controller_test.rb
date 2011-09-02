require 'test_helper'

class HumansControllerTest < ActionController::TestCase
  test "/error routes to errship's standard error page with MongoMapper::DocumentNotFound exception" do
    Errship::Rescuers.expects(:render_404_error).with(MongoMapper::DocumentNotFound, anything)
    
    get :index
  end
end
