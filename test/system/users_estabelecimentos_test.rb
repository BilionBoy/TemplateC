require "application_system_test_case"

class UsersEstabelecimentosTest < ApplicationSystemTestCase
  setup do
    @users_estabelecimento = users_estabelecimentos(:one)
  end

  test "visiting the index" do
    visit users_estabelecimentos_url
    assert_selector "h1", text: "Users estabelecimentos"
  end

  test "should create users estabelecimento" do
    visit users_estabelecimentos_url
    click_on "New users estabelecimento"

    fill_in "Estabelecimento", with: @users_estabelecimento.estabelecimento_id
    fill_in "User", with: @users_estabelecimento.user_id
    click_on "Create Users estabelecimento"

    assert_text "Users estabelecimento was successfully created"
    click_on "Back"
  end

  test "should update Users estabelecimento" do
    visit users_estabelecimento_url(@users_estabelecimento)
    click_on "Edit this users estabelecimento", match: :first

    fill_in "Estabelecimento", with: @users_estabelecimento.estabelecimento_id
    fill_in "User", with: @users_estabelecimento.user_id
    click_on "Update Users estabelecimento"

    assert_text "Users estabelecimento was successfully updated"
    click_on "Back"
  end

  test "should destroy Users estabelecimento" do
    visit users_estabelecimento_url(@users_estabelecimento)
    click_on "Destroy this users estabelecimento", match: :first

    assert_text "Users estabelecimento was successfully destroyed"
  end
end
