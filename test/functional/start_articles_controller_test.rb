require 'test_helper'

class StartArticlesControllerTest < ActionController::TestCase
  setup do
    @start_article = start_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:start_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create start_article" do
    assert_difference('StartArticle.count') do
      post :create, start_article: @start_article.attributes
    end

    assert_redirected_to start_article_path(assigns(:start_article))
  end

  test "should show start_article" do
    get :show, id: @start_article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @start_article
    assert_response :success
  end

  test "should update start_article" do
    put :update, id: @start_article, start_article: @start_article.attributes
    assert_redirected_to start_article_path(assigns(:start_article))
  end

  test "should destroy start_article" do
    assert_difference('StartArticle.count', -1) do
      delete :destroy, id: @start_article
    end

    assert_redirected_to start_articles_path
  end
end
