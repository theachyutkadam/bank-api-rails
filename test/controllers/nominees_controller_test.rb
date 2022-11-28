require "test_helper"

class NomineesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nominees_index_url
    assert_response :success
  end

  test "should get new" do
    get nominees_new_url
    assert_response :success
  end

  test "should get create" do
    get nominees_create_url
    assert_response :success
  end

  test "should get update" do
    get nominees_update_url
    assert_response :success
  end

  test "should get show" do
    get nominees_show_url
    assert_response :success
  end

  test "should get delete" do
    get nominees_delete_url
    assert_response :success
  end
end
