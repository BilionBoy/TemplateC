class UsuariosController < ApplicationController
  before_action :authenticate_admin! # Garante que apenas administradores possam acessar essa ação

  def index
    # Busca todos os usuários com suas funções e estabelecimentos
    @usuarios = User.includes(:funcao, :estabelecimentos).all
  end

  def show
    @usuario = User.find(params[:id])
  end

  def destroy
    @usuario = User.find(params[:id]) # Alterar 'parms' para 'params'
    @usuario.destroy
    redirect_to usuarios_path, notice: "Usuário excluído com sucesso."
  end

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end
end
