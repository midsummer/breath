require 'test_helper'

class SighsControllerTest < ActionController::TestCase
  setup do
    @sigh = sighs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sighs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sigh" do
    assert_difference('Sigh.count') do
      post :create, sigh: {  }
    end

    assert_redirected_to sigh_path(assigns(:sigh))
  end

  test "should show sigh" do
    get :show, id: @sigh
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sigh
    assert_response :success
  end

  test "should update sigh" do
    patch :update, id: @sigh, sigh: {  }
    assert_redirected_to sigh_path(assigns(:sigh))
  end

  test "should destroy sigh" do
    assert_difference('Sigh.count', -1) do
      delete :destroy, id: @sigh
    end

    assert_redirected_to sighs_path
  end
end
