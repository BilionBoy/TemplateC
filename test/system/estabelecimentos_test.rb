require "application_system_test_case"

class EstabelecimentosTest < ApplicationSystemTestCase
  setup do
    @estabelecimento = estabelecimentos(:one)
  end

  test "visiting the index" do
    visit estabelecimentos_url
    assert_selector "h1", text: "Estabelecimentos"
  end

  test "should create estabelecimento" do
    visit estabelecimentos_url
    click_on "New estabelecimento"

    fill_in "Cnpj", with: @estabelecimento.cnpj
    fill_in "Endereco", with: @estabelecimento.endereco
    fill_in "Nome", with: @estabelecimento.nome
    fill_in "Telefone", with: @estabelecimento.telefone
    click_on "Create Estabelecimento"

    assert_text "Estabelecimento was successfully created"
    click_on "Back"
  end

  test "should update Estabelecimento" do
    visit estabelecimento_url(@estabelecimento)
    click_on "Edit this estabelecimento", match: :first

    fill_in "Cnpj", with: @estabelecimento.cnpj
    fill_in "Endereco", with: @estabelecimento.endereco
    fill_in "Nome", with: @estabelecimento.nome
    fill_in "Telefone", with: @estabelecimento.telefone
    click_on "Update Estabelecimento"

    assert_text "Estabelecimento was successfully updated"
    click_on "Back"
  end

  test "should destroy Estabelecimento" do
    visit estabelecimento_url(@estabelecimento)
    click_on "Destroy this estabelecimento", match: :first

    assert_text "Estabelecimento was successfully destroyed"
  end
end
