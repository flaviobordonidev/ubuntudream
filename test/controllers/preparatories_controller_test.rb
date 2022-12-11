require "test_helper"

class PreparatoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preparatory = preparatories(:one)
  end

  test "should get index" do
    get preparatories_url
    assert_response :success
  end

  test "should get new" do
    get new_preparatory_url
    assert_response :success
  end

  test "should create preparatory" do
    assert_difference("Preparatory.count") do
      post preparatories_url, params: { preparatory: { duration: @preparatory.duration, name: @preparatory.name, youtube_video_id: @preparatory.youtube_video_id } }
    end

    assert_redirected_to preparatory_url(Preparatory.last)
  end

  test "should show preparatory" do
    get preparatory_url(@preparatory)
    assert_response :success
  end

  test "should get edit" do
    get edit_preparatory_url(@preparatory)
    assert_response :success
  end

  test "should update preparatory" do
    patch preparatory_url(@preparatory), params: { preparatory: { duration: @preparatory.duration, name: @preparatory.name, youtube_video_id: @preparatory.youtube_video_id } }
    assert_redirected_to preparatory_url(@preparatory)
  end

  test "should destroy preparatory" do
    assert_difference("Preparatory.count", -1) do
      delete preparatory_url(@preparatory)
    end

    assert_redirected_to preparatories_url
  end
end
