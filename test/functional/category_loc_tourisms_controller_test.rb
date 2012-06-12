require 'test_helper'

class CategoryLocTourismsControllerTest < ActionController::TestCase
  setup do
    @category_loc_tourism = category_loc_tourisms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_loc_tourisms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_loc_tourism" do
    assert_difference('CategoryLocTourism.count') do
      post :create, category_loc_tourism: { name: @category_loc_tourism.name }
    end

    assert_redirected_to category_loc_tourism_path(assigns(:category_loc_tourism))
  end

  test "should show category_loc_tourism" do
    get :show, id: @category_loc_tourism
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_loc_tourism
    assert_response :success
  end

  test "should update category_loc_tourism" do
    put :update, id: @category_loc_tourism, category_loc_tourism: { name: @category_loc_tourism.name }
    assert_redirected_to category_loc_tourism_path(assigns(:category_loc_tourism))
  end

  test "should destroy category_loc_tourism" do
    assert_difference('CategoryLocTourism.count', -1) do
      delete :destroy, id: @category_loc_tourism
    end

    assert_redirected_to category_loc_tourisms_path
  end
end
