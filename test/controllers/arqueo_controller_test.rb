require 'test_helper'

class ArqueoControllerTest < ActionController::TestCase
  test "should get calcular" do
    get :calcular
    assert_response :success
  end

  test "should get imprimir" do
    get :imprimir
    assert_response :success
  end

end
