module SessionsHelper
  def sign_in(u)
    https!
    post "/login", params: { email: u.email }
    follow_redirect!
    assert_equal '/', path
    https!(false)
  end
end

ActionDispatch::IntegrationTest.include SessionsHelper
