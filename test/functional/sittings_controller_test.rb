require File.join(File.dirname(__FILE__), "..", "test_helper")

class SittingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sittings)
  end

  test "should show sitting" do
    sitting = Factory(:sitting)
    get :show, :id => sitting.to_param
    assert_response :success
  end
end
