# frozen_string_literal: true

class UsersEstabelecimentosController < ApplicationController
  before_action :set_users_estabelecimento, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  def index
    @q = UsersEstabelecimento.ransack(params[:q])
    @pagy, @users_estabelecimentos = pagy(@q.result)
  end

  def new
    @users_estabelecimento = UsersEstabelecimento.new
  end

  def edit
  end

  def create
    @users_estabelecimento = UsersEstabelecimento.new(users_estabelecimento_params)

    if @users_estabelecimento.save
      redirect_to users_estabelecimentos_path, notice: t("messages.created_successfully")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @users_estabelecimento.update(users_estabelecimento_params)
      redirect_to users_estabelecimentos_path, notice: t("messages.updated_successfully"), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @users_estabelecimento.destroy
      redirect_to users_estabelecimentos_url, notice: t("messages.deleted_successfully")
    else
      redirect_to users_estabelecimentos_url, alert: t("messages.delete_failed_due_to_dependencies")
    end
  end

  private

  def set_users_estabelecimento
    @users_estabelecimento = UsersEstabelecimento.find_by(id: params[:id])
    redirect_to users_estabelecimentos_path, alert: t("messages.not_found") unless @users_estabelecimento
  end

  def users_estabelecimento_params
    permitted_attributes = UsersEstabelecimento.column_names.reject { |col| [ "deleted_at", "created_by", "updated_by" ].include?(col) }
    params.require(:users_estabelecimento).permit(permitted_attributes.map(&:to_sym))
  end

  def handle_not_found
    redirect_to users_estabelecimentos_path, alert: t("messages.not_found")
  end
end
