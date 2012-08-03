require 'test_helper'

class TourismLocationsControllerTest < ActionController::TestCase
  setup do
    @tourism_location = tourism_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tourism_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tourism_location" do
    assert_difference('TourismLocation.count') do
      post :create, tourism_location: { address: @tourism_location.address, category_loc_tourism_id: @tourism_location.category_loc_tourism_id, category_tourism_id: @tourism_location.category_tourism_id, city: @tourism_location.city, description: @tourism_location.description, facebook: @tourism_location.facebook, facility: @tourism_location.facility, hours_description: @tourism_location.hours_description, name: @tourism_location.name, phone: @tourism_location.phone, twitter: @tourism_location.twitter, user_id: @tourism_location.user_id, web: @tourism_location.web, zip: @tourism_location.zip }
    end

    assert_redirected_to tourism_location_path(assigns(:tourism_location))
  end

  test "should show tourism_location" do
    get :show, id: @tourism_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tourism_location
    assert_response :success
  end

  test "should update tourism_location" do
    put :update, id: @tourism_location, tourism_location: { address: @tourism_location.address, category_loc_tourism_id: @tourism_location.category_loc_tourism_id, category_tourism_id: @tourism_location.category_tourism_id, city: @tourism_location.city, description: @tourism_location.description, facebook: @tourism_location.facebook, facility: @tourism_location.facility, hours_description: @tourism_location.hours_description, name: @tourism_location.name, phone: @tourism_location.phone, twitter: @tourism_location.twitter, user_id: @tourism_location.user_id, web: @tourism_location.web, zip: @tourism_location.zip }
    assert_redirected_to tourism_location_path(assigns(:tourism_location))
  end

  test "should destroy tourism_location" do
    assert_difference('TourismLocation.count', -1) do
      delete :destroy, id: @tourism_location
    end

    assert_redirected_to tourism_locations_path
  end
end
