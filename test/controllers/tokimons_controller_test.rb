require 'test_helper'

class TokimonsControllerTest < ActionController::TestCase
  setup do
    @tokimon = tokimons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tokimons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tokimon" do
    assert_difference('Tokimon.count') do
      post :create, tokimon: { electric: @tokimon.electric, fight: @tokimon.fight, fire: @tokimon.fire, fly: @tokimon.fly, height: @tokimon.height, ice: @tokimon.ice, name: @tokimon.name, total: @tokimon.total, trainer_id: @tokimon.trainer_id, water: @tokimon.water, weight: @tokimon.weight }
    end

    assert_redirected_to tokimon_path(assigns(:tokimon))
  end

  test "should show tokimon" do
    get :show, id: @tokimon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tokimon
    assert_response :success
  end

  test "should update tokimon" do
    patch :update, id: @tokimon, tokimon: { electric: @tokimon.electric, fight: @tokimon.fight, fire: @tokimon.fire, fly: @tokimon.fly, height: @tokimon.height, ice: @tokimon.ice, name: @tokimon.name, total: @tokimon.total, trainer_id: @tokimon.trainer_id, water: @tokimon.water, weight: @tokimon.weight }
    assert_redirected_to tokimon_path(assigns(:tokimon))
  end

  test "should destroy tokimon" do
    assert_difference('Tokimon.count', -1) do
      delete :destroy, id: @tokimon
    end

    assert_redirected_to tokimons_path
  end
end
