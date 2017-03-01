require 'test_helper'

class RoomInformationsControllerTest < ActionController::TestCase
  setup do
    @room_information = room_informations(:deluxe_room)
    @other_room_information = room_informations(:presidential_suite)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:room_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room_information" do
    assert_difference('RoomInformation.count') do
      post :create, room_information: { description: @room_information.description, price: @room_information.price, room_type: "new_unquie_room_type" }
    end

    assert_redirected_to room_information_path(assigns(:room_information))
  end

  test "should show room_information" do
    get :show, id: @room_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room_information
    assert_response :success
  end

  test "should update room_information" do
    patch :update, id: @room_information, room_information: { description: @room_information.description, price: @room_information.price, room_type: "new_unquie_room_type" }
    assert_redirected_to room_information_path(assigns(:room_information))
  end

  test "should not destroy room_information if room with type present" do
    assert_difference('RoomInformation.count', -1) do
      delete :destroy, id: @room_information
    end

    assert_redirected_to room_informations_path
  end

  test "should destroy room_information if no room with type are present" do
    assert_difference('RoomInformation.count', -1) do
      delete :destroy, id: @other_room_information
    end

    assert_redirected_to room_informations_path
  end
end
