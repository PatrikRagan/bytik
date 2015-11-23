require 'test_helper'

class ScrapsitesControllerTest < ActionController::TestCase
  setup do
    @scrapsite = scrapsites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrapsites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scrapsite" do
    assert_difference('Scrapsite.count') do
      post :create, scrapsite: { bazos: @scrapsite.bazos, nehnutelnosti: @scrapsite.nehnutelnosti }
    end

    assert_redirected_to scrapsite_path(assigns(:scrapsite))
  end

  test "should show scrapsite" do
    get :show, id: @scrapsite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scrapsite
    assert_response :success
  end

  test "should update scrapsite" do
    patch :update, id: @scrapsite, scrapsite: { bazos: @scrapsite.bazos, nehnutelnosti: @scrapsite.nehnutelnosti }
    assert_redirected_to scrapsite_path(assigns(:scrapsite))
  end

  test "should destroy scrapsite" do
    assert_difference('Scrapsite.count', -1) do
      delete :destroy, id: @scrapsite
    end

    assert_redirected_to scrapsites_path
  end
end
