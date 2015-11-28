require 'test_helper'

class AccountMovementsControllerTest < ActionController::TestCase
  setup do
    @account_movement = account_movements(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:account_movements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account_movement" do
    assert_difference('AccountMovement.count') do
      post :create, account_movement: { movement_date: @account_movement.movement_date, user_id: @account_movement.user_id, value: @account_movement.value, value_date: @account_movement.value_date }
    end

    assert_redirected_to account_movement_path(assigns(:account_movement))
  end

  test "should show account_movement" do
    get :show, id: @account_movement
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account_movement
    assert_response :success
  end

  test "should update account_movement" do
    patch :update, id: @account_movement, account_movement: { movement_date: @account_movement.movement_date, user_id: @account_movement.user_id, value: @account_movement.value, value_date: @account_movement.value_date }
    assert_redirected_to account_movement_path(assigns(:account_movement))
  end

  test "should destroy account_movement" do
    assert_difference('AccountMovement.count', -1) do
      delete :destroy, id: @account_movement
    end

    assert_redirected_to account_movements_path
  end
end
