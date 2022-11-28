require "test_helper"

class ParticularsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get particulars_index_url
    assert_response :success
  end

  test "should get new" do
    get particulars_new_url
    assert_response :success
  end

  test "should get create" do
    get particulars_create_url
    assert_response :success
  end

  test "should get update" do
    get particulars_update_url
    assert_response :success
  end

  test "should get show" do
    get particulars_show_url
    assert_response :success
  end

  test "should get delete" do
    get particulars_delete_url
    assert_response :success
  end
end
