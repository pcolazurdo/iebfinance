require 'test_helper'

class ValesControllerTest < ActionController::TestCase
  setup do
    @vale = vales(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vales)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vale" do
    assert_difference('Vale.count') do
      post :create, vale: { comentario: @vale.comentario, cuenta: @vale.cuenta, estado: @vale.estado, fechaEmision: @vale.fechaEmision, fechaRendicion: @vale.fechaRendicion, montoDolares: @vale.montoDolares, montoPesos: @vale.montoPesos, responsable: @vale.responsable }
    end

    assert_redirected_to vale_path(assigns(:vale))
  end

  test "should show vale" do
    get :show, id: @vale
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vale
    assert_response :success
  end

  test "should update vale" do
    patch :update, id: @vale, vale: { comentario: @vale.comentario, cuenta: @vale.cuenta, estado: @vale.estado, fechaEmision: @vale.fechaEmision, fechaRendicion: @vale.fechaRendicion, montoDolares: @vale.montoDolares, montoPesos: @vale.montoPesos, responsable: @vale.responsable }
    assert_redirected_to vale_path(assigns(:vale))
  end

  test "should destroy vale" do
    assert_difference('Vale.count', -1) do
      delete :destroy, id: @vale
    end

    assert_redirected_to vales_path
  end
end
