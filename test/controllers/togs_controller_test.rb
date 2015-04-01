require 'test_helper'

class TogsControllerTest < ActionController::TestCase
  setup do
    @tog = togs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:togs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tog" do
    assert_difference('Tog.count') do
      post :create, tog: {  }
    end

    assert_redirected_to tog_path(assigns(:tog))
  end

  test "should show tog" do
    get :show, id: @tog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tog
    assert_response :success
  end

  test "should update tog" do
    patch :update, id: @tog, tog: {  }
    assert_redirected_to tog_path(assigns(:tog))
  end

  test "should destroy tog" do
    assert_difference('Tog.count', -1) do
      delete :destroy, id: @tog
    end

    assert_redirected_to togs_path
  end
end
