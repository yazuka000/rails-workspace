require "test_helper"

class CreateArticleTest < ActionDispatch::IntegrationTest
  setup do
    @user =
      User.create(
        username: "johndoe",
        email: "johndoe@example.com",
        password: "password",
        admin: false
      )
    sign_in_as(@user)
  end

  test "can create an article" do
    get "/articles/new"
    assert_response :success

    post articles_path,
      params: { article: { title: "can create", description: "article successfully." } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "can create", response.body
  end
end
