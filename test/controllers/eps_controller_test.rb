require 'test_helper'

class EpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ep = eps(:one)
  end

  test "should get index" do
    get eps_url
    assert_response :success
  end

  test "should get new" do
    get new_ep_url
    assert_response :success
  end

  test "should create ep" do
    assert_difference('Ep.count') do
      post eps_url, params: { ep: { codigo_eps: @ep.codigo_eps, enable: @ep.enable, nombre: @ep.nombre } }
    end

    assert_redirected_to ep_url(Ep.last)
  end

  test "should show ep" do
    get ep_url(@ep)
    assert_response :success
  end

  test "should get edit" do
    get edit_ep_url(@ep)
    assert_response :success
  end

  test "should update ep" do
    patch ep_url(@ep), params: { ep: { codigo_eps: @ep.codigo_eps, enable: @ep.enable, nombre: @ep.nombre } }
    assert_redirected_to ep_url(@ep)
  end

  test "should destroy ep" do
    assert_difference('Ep.count', -1) do
      delete ep_url(@ep)
    end

    assert_redirected_to eps_url
  end
end
