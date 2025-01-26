require "application_system_test_case"

class FuncoesTest < ApplicationSystemTestCase
  setup do
    @funcao = funcoes(:one)
  end

  test "visiting the index" do
    visit funcoes_url
    assert_selector "h1", text: "Funcoes"
  end

  test "should create funcao" do
    visit funcoes_url
    click_on "New funcao"

    fill_in "Nome", with: @funcao.nome
    click_on "Create Funcao"

    assert_text "Funcao was successfully created"
    click_on "Back"
  end

  test "should update Funcao" do
    visit funcao_url(@funcao)
    click_on "Edit this funcao", match: :first

    fill_in "Nome", with: @funcao.nome
    click_on "Update Funcao"

    assert_text "Funcao was successfully updated"
    click_on "Back"
  end

  test "should destroy Funcao" do
    visit funcao_url(@funcao)
    click_on "Destroy this funcao", match: :first

    assert_text "Funcao was successfully destroyed"
  end
end
