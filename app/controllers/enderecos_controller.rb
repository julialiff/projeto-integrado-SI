class EnderecosController < ApplicationController
  before_action :set_endereco, only: [:show, :edit, :update, :destroy, :set_default]

  # GET /enderecos
  # GET /enderecos.json
  def index
    @enderecos = Endereco.all
  end

  # GET /enderecos/1
  # GET /enderecos/1.json
  def show
  end

  # GET /enderecos/new
  def new
    @endereco = Endereco.new
  end

  # GET /enderecos/1/edit
  def edit
  end

  def enderecos_by_user
    # user = User.find(current_user.id)
    if current_user
      # @enderecos_user = Endereco.where(user=current_user)
      @enderecos = current_user.enderecos
    else
      # render :not_found
      not_found = 404
    end
  end

  # POST /enderecos
  # POST /enderecos.json
  def create
    @endereco = current_user.enderecos.new(endereco_params)
    # @endereco = Endereco.new(endereco_params)

    respond_to do |format|
      if @endereco.save
        if @endereco.default == true
          set_default()
        end
        format.html { redirect_to meus_enderecos_path, notice: 'Endereço criado com sucesso.' }
        format.json { render :meus_enderecos_path, status: :created }
      else
        format.html { render :new }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enderecos/1
  # PATCH/PUT /enderecos/1.json
  def update
    respond_to do |format|
      if @endereco.update(endereco_params)
        if @endereco.default == true
          set_default()
        end
        format.html { redirect_to meus_enderecos_path, notice: 'Endereco atualizado com sucesso.' }
        format.json { render :meus_enderecos_path, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @endereco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enderecos/1
  # DELETE /enderecos/1.json
  def destroy
    @endereco.destroy
    respond_to do |format|
      format.html { redirect_to meus_enderecos_path, notice: 'Endereco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_default
    endereco_padrao = current_user.enderecos.find_by("enderecos.default = ?", true)
    if endereco_padrao
      endereco_padrao.default = false
      endereco_padrao.save
    end
    @endereco.default = true
    @endereco.save
    respond_to do |format|
      format.html { redirect_to meus_enderecos_path, notice: 'Endereço padrão alterado com sucesso.' }
      format.json { render json: @endereco }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_endereco
      @endereco = Endereco.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def endereco_params
      params.require(:endereco).permit(:logradouro, :cep, :bairro, :cidade, :estado, :complemento, :numero, :user_id, :nome, :default)
    end
  end
