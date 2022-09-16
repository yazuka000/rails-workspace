require "test_helper"

class SignupUserTest < ActionDispatch::IntegrationTest
  test "signup new user" do
    get "/signup"
    assert_response :success

    post "/users",
        params: {
          user: {
            username: "johndoe",
            email: "johndoe@example.com",
            password: "password"
          }
        }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    post login_path,
    params: {
      session: {
        email: "johndoe@example.com",
        password: "password"
      }
    }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "johndoe", response.body
  end
end
