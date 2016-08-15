require 'test_helper'

class DireccionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @direccion = direccions(:one)
  end

  test "should get index" do
    get direccions_url
    assert_response :success
  end

  test "should get new" do
    get new_direccion_url
    assert_response :success
  end

  test "should create direccion" do
    assert_difference('Direccion.count') do
      post direccions_url, params: { direccion: { barrio: @direccion.barrio, direccion: @direccion.direccion, municipio_id: @direccion.municipio_id, numero_id: @direccion.numero_id, numero_type: @direccion.numero_type, tel: @direccion.tel } }
    end

    assert_redirected_to direccion_url(Direccion.last)
  end

  test "should show direccion" do
    get direccion_url(@direccion)
    assert_response :success
  end

  test "should get edit" do
    get edit_direccion_url(@direccion)
    assert_response :success
  end

  test "should update direccion" do
    patch direccion_url(@direccion), params: { direccion: { barrio: @direccion.barrio, direccion: @direccion.direccion, municipio_id: @direccion.municipio_id, numero_id: @direccion.numero_id, numero_type: @direccion.numero_type, tel: @direccion.tel } }
    assert_redirected_to direccion_url(@direccion)
  end

  test "should destroy direccion" do
    assert_difference('Direccion.count', -1) do
      delete direccion_url(@direccion)
    end

    assert_redirected_to direccions_url
  end
end
