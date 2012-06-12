require 'test_helper'

class TourismArticlesControllerTest < ActionController::TestCase
  setup do
    @tourism_article = tourism_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tourism_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tourism_article" do
    assert_difference('TourismArticle.count') do
      post :create, tourism_article: { content: @tourism_article.content, title: @tourism_article.title, video: @tourism_article.video }
    end

    assert_redirected_to tourism_article_path(assigns(:tourism_article))
  end

  test "should show tourism_article" do
    get :show, id: @tourism_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tourism_article
    assert_response :success
  end

  test "should update tourism_article" do
    put :update, id: @tourism_article, tourism_article: { content: @tourism_article.content, title: @tourism_article.title, video: @tourism_article.video }
    assert_redirected_to tourism_article_path(assigns(:tourism_article))
  end

  test "should destroy tourism_article" do
    assert_difference('TourismArticle.count', -1) do
      delete :destroy, id: @tourism_article
    end

    assert_redirected_to tourism_articles_path
  end
end
