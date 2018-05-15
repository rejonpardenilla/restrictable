require "test_helper"

class RestrictableControllerTest < ActionDispatch::IntegrationTest
  def test_only_allow_admin_user
    sign_in users(:admin)
    get '/allow-admin'
    assert_response :success
  end

  def test_normal_user_is_forbidden_to_access
    sign_in users(:normal)
    get '/allow-admin'
    assert_response :forbidden
  end
end
