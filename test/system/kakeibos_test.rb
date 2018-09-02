require "application_system_test_case"

class KakeibosTest < ApplicationSystemTestCase
  setup do
    @kakeibo = kakeibos(:one)
  end

  test "visiting the index" do
    visit kakeibos_url
    assert_selector "h1", text: "Kakeibos"
  end

  test "creating a Kakeibo" do
    visit kakeibos_url
    click_on "New Kakeibo"

    fill_in "Amusement", with: @kakeibo.amusement
    fill_in "Beauty Exp", with: @kakeibo.beauty_exp
    fill_in "Daily Necessities", with: @kakeibo.daily_necessities
    fill_in "Entertainment Exp", with: @kakeibo.entertainment_exp
    fill_in "Fixture", with: @kakeibo.fixture
    fill_in "Food Exp", with: @kakeibo.food_exp
    fill_in "Kicho Date", with: @kakeibo.kicho_date
    fill_in "Memo", with: @kakeibo.memo
    fill_in "Otherwise Exp", with: @kakeibo.otherwise_exp
    fill_in "Transport Exp", with: @kakeibo.transport_exp
    click_on "Create Kakeibo"

    assert_text "Kakeibo was successfully created"
    click_on "Back"
  end

  test "updating a Kakeibo" do
    visit kakeibos_url
    click_on "Edit", match: :first

    fill_in "Amusement", with: @kakeibo.amusement
    fill_in "Beauty Exp", with: @kakeibo.beauty_exp
    fill_in "Daily Necessities", with: @kakeibo.daily_necessities
    fill_in "Entertainment Exp", with: @kakeibo.entertainment_exp
    fill_in "Fixture", with: @kakeibo.fixture
    fill_in "Food Exp", with: @kakeibo.food_exp
    fill_in "Kicho Date", with: @kakeibo.kicho_date
    fill_in "Memo", with: @kakeibo.memo
    fill_in "Otherwise Exp", with: @kakeibo.otherwise_exp
    fill_in "Transport Exp", with: @kakeibo.transport_exp
    click_on "Update Kakeibo"

    assert_text "Kakeibo was successfully updated"
    click_on "Back"
  end

  test "destroying a Kakeibo" do
    visit kakeibos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Kakeibo was successfully destroyed"
  end
end
