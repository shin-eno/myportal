require 'test_helper'

class KakeibosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kakeibo = kakeibos(:one)
  end

  test "should get index" do
    get kakeibos_url
    assert_response :success
  end

  test "should get new" do
    get new_kakeibo_url
    assert_response :success
  end

  test "should create kakeibo" do
    assert_difference('Kakeibo.count') do
      post kakeibos_url, params: { kakeibo: { amusement: @kakeibo.amusement, beauty_exp: @kakeibo.beauty_exp, daily_necessities: @kakeibo.daily_necessities, entertainment_exp: @kakeibo.entertainment_exp, fixture: @kakeibo.fixture, food_exp: @kakeibo.food_exp, kicho_date: @kakeibo.kicho_date, memo: @kakeibo.memo, otherwise_exp: @kakeibo.otherwise_exp, transport_exp: @kakeibo.transport_exp } }
    end

    assert_redirected_to kakeibo_url(Kakeibo.last)
  end

  test "should show kakeibo" do
    get kakeibo_url(@kakeibo)
    assert_response :success
  end

  test "should get edit" do
    get edit_kakeibo_url(@kakeibo)
    assert_response :success
  end

  test "should update kakeibo" do
    patch kakeibo_url(@kakeibo), params: { kakeibo: { amusement: @kakeibo.amusement, beauty_exp: @kakeibo.beauty_exp, daily_necessities: @kakeibo.daily_necessities, entertainment_exp: @kakeibo.entertainment_exp, fixture: @kakeibo.fixture, food_exp: @kakeibo.food_exp, kicho_date: @kakeibo.kicho_date, memo: @kakeibo.memo, otherwise_exp: @kakeibo.otherwise_exp, transport_exp: @kakeibo.transport_exp } }
    assert_redirected_to kakeibo_url(@kakeibo)
  end

  test "should destroy kakeibo" do
    assert_difference('Kakeibo.count', -1) do
      delete kakeibo_url(@kakeibo)
    end

    assert_redirected_to kakeibos_url
  end
end
