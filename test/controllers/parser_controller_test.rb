require 'test_helper'

class ParserControllerTest < ActionController::TestCase
  test "should get puls" do
    get :puls
    assert_response :success
  end

end
