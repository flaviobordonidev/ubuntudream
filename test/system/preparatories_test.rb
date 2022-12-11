require "application_system_test_case"

class PreparatoriesTest < ApplicationSystemTestCase
  setup do
    @preparatory = preparatories(:one)
  end

  test "visiting the index" do
    visit preparatories_url
    assert_selector "h1", text: "Preparatories"
  end

  test "should create preparatory" do
    visit preparatories_url
    click_on "New preparatory"

    fill_in "Duration", with: @preparatory.duration
    fill_in "Name", with: @preparatory.name
    fill_in "Youtube video", with: @preparatory.youtube_video_id
    click_on "Create Preparatory"

    assert_text "Preparatory was successfully created"
    click_on "Back"
  end

  test "should update Preparatory" do
    visit preparatory_url(@preparatory)
    click_on "Edit this preparatory", match: :first

    fill_in "Duration", with: @preparatory.duration
    fill_in "Name", with: @preparatory.name
    fill_in "Youtube video", with: @preparatory.youtube_video_id
    click_on "Update Preparatory"

    assert_text "Preparatory was successfully updated"
    click_on "Back"
  end

  test "should destroy Preparatory" do
    visit preparatory_url(@preparatory)
    click_on "Destroy this preparatory", match: :first

    assert_text "Preparatory was successfully destroyed"
  end
end
