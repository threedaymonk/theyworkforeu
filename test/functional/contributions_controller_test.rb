require File.join(File.dirname(__FILE__), "..", "test_helper")

class ContributionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contributions)
  end

  test "should show contribution" do
    contribution = Factory(:contribution)
    get :show, :id => contribution.to_param
    assert_response :success
  end
end
