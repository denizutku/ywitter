require "test_helper"

class YweetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yweet = yweets(:one)
  end

  test "should get index" do
    get yweets_url
    assert_response :success
  end

  test "should get new" do
    get new_yweet_url
    assert_response :success
  end

  test "should create yweet" do
    assert_difference('Yweet.count') do
      post yweets_url, params: { yweet: { yweet: @yweet.yweet } }
    end

    assert_redirected_to yweet_url(Yweet.last)
  end

  test "should show yweet" do
    get yweet_url(@yweet)
    assert_response :success
  end

  test "should get edit" do
    get edit_yweet_url(@yweet)
    assert_response :success
  end

  test "should update yweet" do
    patch yweet_url(@yweet), params: { yweet: { yweet: @yweet.yweet } }
    assert_redirected_to yweet_url(@yweet)
  end

  test "should destroy yweet" do
    assert_difference('Yweet.count', -1) do
      delete yweet_url(@yweet)
    end

    assert_redirected_to yweets_url
  end
end
