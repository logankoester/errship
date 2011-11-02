require 'test_helper'

class ErrshipTest < ActiveSupport::TestCase
  test 'Errship is a module' do
    assert_kind_of Module, Errship
  end
end

class ApplicationControllerTest < ActionController::TestCase
  test "/error routes to errship's standard error page" do
    assert_routing '/error', { :controller => 'application', :action => 'errship_standard' }
  end

  test "flashback sets the error message flash" do
    get :try_flashback, { 'message' => 'tricky' }
    assert_equal 'tricky', flash[:error]
  end
end

class ErrshipIntegrationTest < ActionController::IntegrationTest
  test "/any_nonexistant_route is routed to errship's 404 page" do
    get '/any_nonexistant_route'
    assert_routing '/error', { :controller => 'application', :action => 'errship_standard' }
    assert_response :success
  end
  
  test "errship's 404 page has a 404 status code if configured so" do
    Errship.status_code_success = false
    get '/any_nonexistant_route'
    assert_response :missing
  end

end
