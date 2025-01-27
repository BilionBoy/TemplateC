class CategoriasController < ApplicationController
  before_action :set_categoria, only: %i[show edit update destroy]
  before_action :set_estabelecimento, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = Categoria.ransack(params[:q])
    if @estabelecimento
      # Filtra as categorias associadas ao estabelecimento do usuário logado
      @categorias = @estabelecimento.categorias.ransack(params[:q]).result
    else
      @categorias = Categoria.none # Se o estabelecimento não existir, retorna vazio
    end
    @pagy, @categorias = pagy(@categorias)
  end

  def new
    @categoria = Categoria.new
  end

  def edit
  end

  def create
    @categoria = Categoria.new(categoria_params)

    if @categoria.save
      redirect_to categorias_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @categoria.update(categoria_params)
      redirect_to categorias_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @categoria.destroy
      redirect_to categorias_url, notice: t("messages.deleted_successfully")
    else
      redirect_to categorias_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_categoria
    @categoria = Categoria.find_by(id: params[:id])
    redirect_to categorias_path, alert: t("messages.not_found") unless @categoria
  end

  def set_estabelecimento
    # Aqui, buscamos o estabelecimento associado ao usuário através da tabela intermediária
    @estabelecimento = current_user.estabelecimentos.first
    redirect_to root_path, alert: t("messages.not_authorized") unless @estabelecimento
  end

  def categoria_params
    permitted_attributes = Categoria.column_names.reject { |col| [ "deleted_at", "created_by", "updated_by" ].include?(col) }
    params.require(:categoria).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to categorias_path, alert: t("messages.not_found")
  end
end
