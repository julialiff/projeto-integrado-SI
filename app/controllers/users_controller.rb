class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit, :update, :destroy, :admin, :activate_deactivate, :deactivate, :check_active, :user_details]

  def index
    admin_control
    @users = User.all
    @pesquisa = params[:pesquisa]
    admin_only = params[:admin_only]
    not_admin = params[:not_admin]
    active = params[:active_only]
    not_active = params[:not_active]

    if @pesquisa
      search = '%' + @pesquisa + '%'
      @users = @users.where("nome ILIKE ? OR email ILIKE ?", search, search)
    end
    if admin_only
      @users = @users.where(is_admin: true)
    end
    if not_admin
      @users = @users.where(is_admin: false)
    end
    if active
      @users = @users.where(is_active: true)
    end
    if not_active
      @users = @users.where(is_active: false)
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        @user.telefone = @user.telefone.gsub(/\D/, '')
        @user.save
        format.html { redirect_to root_path, notice: 'Cadastro feito com sucesso.' }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|  def user_details
      admin_control
      puts @user
    end
      if @user.update(user_params)
        @user.telefone = @user.telefone.gsub(/\D/, '')
        @user.save
        redirect_to dados_cadastrais_path, notice: 'Cadastro atualizado com sucesso.'
      else
        format.html { render editar_path }      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Usuário excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  def deactivate
    @user.is_active = !@user.is_active
    @user.save
    redirect_to root_path, notice: "Conta desativada com sucesso."
    sign_out @user
  end

  ###################### ADMIN ###################### 
  def admin_control
    if !current_user || !current_user.is_admin
      redirect_to root_path
    end
  end

  def change_admin_status
    user = User.find(params[:id])
    user.is_admin = !user.is_admin
    user.save
    redirect_to area_admin_usuarios_path, notice: 'Status de administrador do usuário alterado com sucesso.'
  end

  def activate_deactivate
    @user.is_active = !@user.is_active
    @user.save
    redirect_back fallback_location: root_path
  end

  def user_details
    admin_control
    puts @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id]
        @user = User.find(params[:id])
      elsif current_user
        @user = current_user
      else
        redirect_to root_path, notice: 'Faça login para acessar esta área'
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:is_admin, :nome, :documento, :data_nascimento, :telefone)
    end
end
