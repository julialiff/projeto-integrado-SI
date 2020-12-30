class ComerciantesController < ApplicationController
  before_action :set_comerciante, only: [:show, :edit, :update, :destroy, :activate_deactivate]

  def index
    check_admin
    @comerciantes = Comerciante.all
  end

  def show
  end

  def new
    @comerciante = Comerciante.new
  end

  def edit
  end

  def create
    @comerciante = Comerciante.new(comerciante_params)

    respond_to do |format|
      if @comerciante.save
        format.html { redirect_to root_path, notice: 'Cadastro feito com sucesso.' }
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @comerciante.update(comerciante_params)
        format.html { redirect_to root_path, notice: 'Cadastro feito com sucesso.' }
      else
        render :edit
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Cadastro feito com sucesso.' }
    end
  end

  ################################### ADMIN ########################

  def check_admin
    if current_user
      if !current_user.is_admin
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def activate_deactivate
    @comerciante.is_active = !@comerciante.is_active
    @comerciante.save
    redirect_back fallback_location: root_path
  end

  private

    def set_comerciante
      if current_comerciante
        @comerciante = current_comerciante
      else
        @comerciante = Comerciante.find(params[:id])
      end
    end

    def comerciante_params
      params.require(:comerciante).permit(:nome, :documento, :email)
    end

end