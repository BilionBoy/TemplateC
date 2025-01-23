# frozen_string_literal: true

class FuncoesController < ApplicationController
  before_action :set_funcao, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

 def index
    @q = Funcao.ransack(params[:q])
    @pagy, @funcoes = pagy(@q.result, limit: 7)
  end

  def new
    @funcao = Funcao.new
  end

  def edit
  end

  def create
    @funcao = Funcao.new(funcao_params)

    if @funcao.save
      redirect_to funcoes_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @funcao.update(funcao_params)
      redirect_to funcoes_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @funcao.destroy
      redirect_to funcoes_url, notice: t("messages.deleted_successfully")
    else
      redirect_to funcoes_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_funcao
    @funcao = Funcao.find_by(id: params[:id])
    redirect_to funcoes_path, alert: t("messages.not_found") unless @funcao
  end

  def funcao_params
    permitted_attributes = Funcao.column_names.reject { |col| [ "deleted_at", "created_by", "updated_by" ].include?(col) }
    params.require(:funcao).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to funcoes_path, alert: t("messages.not_found")
  end
end
