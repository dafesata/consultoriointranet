require 'test_helper'

class ConsultoriosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consultorio = consultorios(:one)
  end

  test "should get index" do
    get consultorios_url
    assert_response :success
  end

  test "should get new" do
    get new_consultorio_url
    assert_response :success
  end

  test "should create consultorio" do
    assert_difference('Consultorio.count') do
      post consultorios_url, params: { consultorio: { nombre: @consultorio.nombre } }
    end

    assert_redirected_to consultorio_url(Consultorio.last)
  end

  test "should show consultorio" do
    get consultorio_url(@consultorio)
    assert_response :success
  end

  test "should get edit" do
    get edit_consultorio_url(@consultorio)
    assert_response :success
  end

  test "should update consultorio" do
    patch consultorio_url(@consultorio), params: { consultorio: { nombre: @consultorio.nombre } }
    assert_redirected_to consultorio_url(@consultorio)
  end

  test "should destroy consultorio" do
    assert_difference('Consultorio.count', -1) do
      delete consultorio_url(@consultorio)
    end

    assert_redirected_to consultorios_url
  end
end
