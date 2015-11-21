require 'test_helper'

class InvestorsControllerTest < ActionController::TestCase
  setup do
    @investor = investors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create investor" do
    assert_difference('Investor.count') do
      post :create, investor: { NIF: @investor.NIF, address: @investor.address, country: @investor.country, full_name: @investor.full_name, town: @investor.town, zip_code: @investor.zip_code }
    end

    assert_redirected_to investor_path(assigns(:investor))
  end

  test "should show investor" do
    get :show, id: @investor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @investor
    assert_response :success
  end

  test "should update investor" do
    patch :update, id: @investor, investor: { NIF: @investor.NIF, address: @investor.address, country: @investor.country, full_name: @investor.full_name, town: @investor.town, zip_code: @investor.zip_code }
    assert_redirected_to investor_path(assigns(:investor))
  end

  test "should destroy investor" do
    assert_difference('Investor.count', -1) do
      delete :destroy, id: @investor
    end

    assert_redirected_to investors_path
  end
end
