require 'test_helper'

class FolktalesControllerTest < ActionController::TestCase
  setup do
    @folktale = folktales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:folktales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create folktale" do
    assert_difference('Folktale.count') do
      post :create, folktale: { description: @folktale.description, title: @folktale.title, user_id: @folktale.user_id }
    end

    assert_redirected_to folktale_path(assigns(:folktale))
  end

  test "should show folktale" do
    get :show, id: @folktale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @folktale
    assert_response :success
  end

  test "should update folktale" do
    put :update, id: @folktale, folktale: { description: @folktale.description, title: @folktale.title, user_id: @folktale.user_id }
    assert_redirected_to folktale_path(assigns(:folktale))
  end

  test "should destroy folktale" do
    assert_difference('Folktale.count', -1) do
      delete :destroy, id: @folktale
    end

    assert_redirected_to folktales_path
  end
end
