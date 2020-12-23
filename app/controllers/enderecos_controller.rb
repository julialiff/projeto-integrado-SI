class EnderecosController < ApplicationController
  before_action :set_endereco, only: [:show, :edit, :update, :destroy]

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
    if current_user
      @enderecos_user = Endereco.where(user=current_user)
    else
      # render :not_found
      not_found = 404
    end
  end

  # POST /enderecos
  # POST /enderecos.json
  def create
    @endereco = Endereco.new(endereco_params)

    respond_to do |format|
      if @endereco.save
        format.html { redirect_to @endereco, notice: 'Endereco was successfully created.' }
        format.json { render :show, status: :created, location: @endereco }
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
        format.html { redirect_to @endereco, notice: 'Endereco was successfully updated.' }
        format.json { render :show, status: :ok, location: @endereco }
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
      format.html { redirect_to enderecos_url, notice: 'Endereco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_endereco
      @endereco = Endereco.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def endereco_params
      params.require(:endereco).permit(:logradouro, :cep, :bairro, :cidade, :estado, :complemento, :numero)
    end
  end
