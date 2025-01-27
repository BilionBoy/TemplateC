# frozen_string_literal: true
class EstabelecimentosController < ApplicationController
  before_action :set_estabelecimento, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

 def index
    @q = Estabelecimento.ransack(params[:q])
    @pagy, @estabelecimentos = pagy(@q.result)
  end

  def new
    @estabelecimento = Estabelecimento.new
  end

  def edit
  end

  def create
    @estabelecimento = Estabelecimento.new(estabelecimento_params)

    if @estabelecimento.save
      redirect_to estabelecimentos_path, notice: t('messages.created_successfully')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @estabelecimento.update(estabelecimento_params)
      redirect_to estabelecimentos_path, notice: t('messages.updated_successfully'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @estabelecimento.destroy
      redirect_to estabelecimentos_url, notice: t('messages.deleted_successfully')
    else
      redirect_to estabelecimentos_url, alert: t('messages.delete_failed_due_to_dependencies')
    end   
  end

  private

  def set_estabelecimento
    @estabelecimento = Estabelecimento.find_by(id: params[:id])
    return redirect_to estabelecimentos_path, alert: t('messages.not_found') unless @estabelecimento
  end

  def estabelecimento_params
    permitted_attributes = Estabelecimento.column_names.reject { |col| ['deleted_at', 'created_by', 'updated_by'].include?(col) }
    params.require(:estabelecimento).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to estabelecimentos_path, alert: t('messages.not_found')
  end
end
