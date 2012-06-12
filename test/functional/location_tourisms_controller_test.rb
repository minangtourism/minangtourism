require 'test_helper'

class LocationTourismsControllerTest < ActionController::TestCase
  setup do
    @location_tourism = location_tourisms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_tourisms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_tourism" do
    assert_difference('LocationTourism.count') do
      post :create, location_tourism: { address: @location_tourism.address, category_loc_tourism_id: @location_tourism.category_loc_tourism_id, category_tourism_id: @location_tourism.category_tourism_id, city: @location_tourism.city, description: @location_tourism.description, facebook: @location_tourism.facebook, facility: @location_tourism.facility, hours_description: @location_tourism.hours_description, name: @location_tourism.name, phone: @location_tourism.phone, twitter: @location_tourism.twitter, user_id: @location_tourism.user_id, web: @location_tourism.web, zip: @location_tourism.zip }
    end

    assert_redirected_to location_tourism_path(assigns(:location_tourism))
  end

  test "should show location_tourism" do
    get :show, id: @location_tourism
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_tourism
    assert_response :success
  end

  test "should update location_tourism" do
    put :update, id: @location_tourism, location_tourism: { address: @location_tourism.address, category_loc_tourism_id: @location_tourism.category_loc_tourism_id, category_tourism_id: @location_tourism.category_tourism_id, city: @location_tourism.city, description: @location_tourism.description, facebook: @location_tourism.facebook, facility: @location_tourism.facility, hours_description: @location_tourism.hours_description, name: @location_tourism.name, phone: @location_tourism.phone, twitter: @location_tourism.twitter, user_id: @location_tourism.user_id, web: @location_tourism.web, zip: @location_tourism.zip }
    assert_redirected_to location_tourism_path(assigns(:location_tourism))
  end

  test "should destroy location_tourism" do
    assert_difference('LocationTourism.count', -1) do
      delete :destroy, id: @location_tourism
    end

    assert_redirected_to location_tourisms_path
  end
end
