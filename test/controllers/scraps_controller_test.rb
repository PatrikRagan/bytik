require 'test_helper'

class ScrapsControllerTest < ActionController::TestCase
  setup do
    @scrap = scraps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scraps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scrap" do
    assert_difference('Scrap.count') do
      post :create, scrap: { city: @scrap.city, keywords: @scrap.keywords, last_search_time: @scrap.last_search_time, number_of_results: @scrap.number_of_results, part_of_town: @scrap.part_of_town, price_max: @scrap.price_max, price_min: @scrap.price_min, room_count: @scrap.room_count, time_of_result_expiration: @scrap.time_of_result_expiration }
    end

    assert_redirected_to scrap_path(assigns(:scrap))
  end

  test "should show scrap" do
    get :show, id: @scrap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scrap
    assert_response :success
  end

  test "should update scrap" do
    patch :update, id: @scrap, scrap: { city: @scrap.city, keywords: @scrap.keywords, last_search_time: @scrap.last_search_time, number_of_results: @scrap.number_of_results, part_of_town: @scrap.part_of_town, price_max: @scrap.price_max, price_min: @scrap.price_min, room_count: @scrap.room_count, time_of_result_expiration: @scrap.time_of_result_expiration }
    assert_redirected_to scrap_path(assigns(:scrap))
  end

  test "should destroy scrap" do
    assert_difference('Scrap.count', -1) do
      delete :destroy, id: @scrap
    end

    assert_redirected_to scraps_path
  end
end
