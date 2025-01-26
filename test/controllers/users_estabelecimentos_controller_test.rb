require "test_helper"

class UsersEstabelecimentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_estabelecimento = users_estabelecimentos(:one)
  end

  test "should get index" do
    get users_estabelecimentos_url
    assert_response :success
  end

  test "should get new" do
    get new_users_estabelecimento_url
    assert_response :success
  end

  test "should create users_estabelecimento" do
    assert_difference("UsersEstabelecimento.count") do
      post users_estabelecimentos_url, params: { users_estabelecimento: { estabelecimento_id: @users_estabelecimento.estabelecimento_id, user_id: @users_estabelecimento.user_id } }
    end

    assert_redirected_to users_estabelecimento_url(UsersEstabelecimento.last)
  end

  test "should show users_estabelecimento" do
    get users_estabelecimento_url(@users_estabelecimento)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_estabelecimento_url(@users_estabelecimento)
    assert_response :success
  end

  test "should update users_estabelecimento" do
    patch users_estabelecimento_url(@users_estabelecimento), params: { users_estabelecimento: { estabelecimento_id: @users_estabelecimento.estabelecimento_id, user_id: @users_estabelecimento.user_id } }
    assert_redirected_to users_estabelecimento_url(@users_estabelecimento)
  end

  test "should destroy users_estabelecimento" do
    assert_difference("UsersEstabelecimento.count", -1) do
      delete users_estabelecimento_url(@users_estabelecimento)
    end

    assert_redirected_to users_estabelecimentos_url
  end
end
