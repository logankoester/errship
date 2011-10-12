require 'test_helper'

class BrainsControllerTest < ActionController::TestCase
  test "/error routes to errship's standard error page with ActiveRecord::RecordNotFound" do
    @controller.expects(:render_404_error).with(anything)
    
    get :index
  end
end
