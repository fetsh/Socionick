require 'test_helper'

class StypesControllerTest < ActionController::TestCase
  setup do
    @stype = stypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stype" do
    assert_difference('Stype.count') do
      post :create, :stype => @stype.attributes
    end

    assert_redirected_to stype_path(assigns(:stype))
  end

  test "should show stype" do
    get :show, :id => @stype.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @stype.to_param
    assert_response :success
  end

  test "should update stype" do
    put :update, :id => @stype.to_param, :stype => @stype.attributes
    assert_redirected_to stype_path(assigns(:stype))
  end

  test "should destroy stype" do
    assert_difference('Stype.count', -1) do
      delete :destroy, :id => @stype.to_param
    end

    assert_redirected_to stypes_path
  end
end
