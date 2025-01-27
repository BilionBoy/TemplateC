class ProdutosController < ApplicationController
  before_action :set_produto, only: %i[show edit update destroy]
  before_action :set_estabelecimento, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Produto.ransack(params[:q])
    if @estabelecimento
      # Filtra os produtos associados às categorias do estabelecimento do usuário logado
      @produtos = @estabelecimento.produtos.ransack(params[:q]).result
    else
      @produtos = Produto.none # Se o estabelecimento não existir, retorna vazio
    end
    @pagy, @produtos = pagy(@produtos)
  end

  def new
    # Adiciona o carregamento do estabelecimento
    set_estabelecimento

    @produto = Produto.new
    @categorias = @estabelecimento.categorias
  end

  def edit
  end

  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      redirect_to produtos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @produto.update(produto_params)
      redirect_to produtos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @produto.destroy
      redirect_to produtos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to produtos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_produto
    @produto = Produto.find_by(id: params[:id])
    redirect_to produtos_path, alert: t("messages.not_found") unless @produto
  end

  def set_estabelecimento
    # Aqui, buscamos o estabelecimento associado ao usuário através da tabela intermediária
    @estabelecimento = current_user.estabelecimentos.first
    redirect_to root_path, alert: t("messages.not_authorized") unless @estabelecimento
  end

  def produto_params
    permitted_attributes = Produto.column_names.reject { |col| [ "deleted_at", "created_by", "updated_by" ].include?(col) }
    params.require(:produto).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to produtos_path, alert: t("messages.not_found")
  end
end
