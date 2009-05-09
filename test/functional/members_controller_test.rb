require File.join(File.dirname(__FILE__), "..", "test_helper")

class MembersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should show member" do
    member = Factory(:member)
    get :show, :id => member.to_param
    assert_response :success
  end
end
