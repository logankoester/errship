require 'test_helper'

class HumansControllerTest < ActionController::TestCase
  test "/error routes to errship's standard error page with MongoMapper::DocumentNotFound exception" do
    @controller.expects(:render_404_error).with(anything)
    
    get :index
  end
end
