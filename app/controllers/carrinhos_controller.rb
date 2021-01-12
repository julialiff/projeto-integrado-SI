class CarrinhosController < ApplicationController
  before_action :set_carrinho, only: [:show, :edit, :update, :destroy]

  # GET /carrinhos
  # GET /carrinhos.json
  def index
    @carrinhos = Carrinho.all
  end

  # GET /carrinhos/1
  # GET /carrinhos/1.json
  def show
  end

  # GET /carrinhos/new
  def new
    @carrinho = Carrinho.new
  end

  # GET /carrinhos/1/edit
  def edit
  end

  def add_to_carrinho
    product_id = carrinho_params['product_id'].to_i
    user_id = carrinho_params['user_id'].to_i
    qtd = carrinho_params['quantidade'].to_i
    @carrinho = find_carrinho(user_id, product_id)

    if @carrinho
      # Se houver um registro com mesmo usuário e produto,
      # apenas atualiza a quantidade ao invés de criar um novo.
      if tem_estoque?(product_id, qtd)
        updated_carrinho_params = carrinho_params
        updated_carrinho_params['quantidade'] = qtd + @carrinho.quantidade
        @carrinho.update(updated_carrinho_params)

        altera_estoque(product_id, qtd)

        redirect_to meu_carrinho_path, notice: 'Produto adicionado ao carrinho com sucesso.'
      else
        redirect_back fallback_location: root_path, alert: 'Não há estoque suficiente para este produto.'
      end
    else
      altera_estoque(carrinho_params['product_id'].to_i, carrinho_params['quantidade'].to_i)
      create()
    end
  end

  def altera_estoque(product_id, qtd)
    product = Product.find(product_id)
    product.quantidade = product.quantidade - qtd
    product.save
  end

  def tem_estoque?(product_id, qtd)
    product = Product.find(product_id)
    (product.quantidade - qtd) >= 0
  end

  # POST /carrinhos
  # POST /carrinhos.json
  def create
    @carrinho = Carrinho.new(carrinho_params)

    if @carrinho.save
      redirect_to meu_carrinho_path, notice: 'Produto adicionado ao carrinho com sucesso.'
    else
      redirect_back fallback_location: root_path, alert: 'Erro ao adicionar o produto ao carrinho.'
    end

  end

  # PATCH/PUT /carrinhos/1
  # PATCH/PUT /carrinhos/1.json
  def update
    respond_to do |format|
      if @carrinho.update(carrinho_params)
        format.html { redirect_to @carrinho, notice: 'Carrinho was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrinho }
      else
        format.html { render :edit }
        format.json { render json: @carrinho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carrinhos/1
  # DELETE /carrinhos/1.json
  def destroy
    @carrinho.destroy
    redirect_back fallback_location: meu_carrinho_path
  end

  def remover_do_carrinho
    # Função para remover um produto do carrinho voltando o estoque dele para o que estava antes
    product_id = @carrinho.product_id
    qtd = @carrinho.quantidade * (-1)
    altera_estoque(product_id, qtd)
    @carrinho.destroy
    redirect_back fallback_location: meu_carrinho_path, notice: "Produto removido do carrinho com sucesso."
  end

  def limpar_carrinho
    # Função para quando o usuário escolhe remover todos os itens do carrinho
    if current_user
      current_user.carrinhos.each do |carrinho|
        product_id = carrinho.product_id
        qtd = carrinho.quantidade * (-1)
        altera_estoque(product_id, qtd)
        carrinho.destroy
      redirect_back fallback_location: root_path, notice: "Itens removidos do carrinho com sucesso."
      end
    else
      redirect_back fallback_location: root_path
    end
  end

  def carrinho_usuario
    @products_carrinho = []
    @total = 0
    if current_user
      products_carrinho = current_user.carrinhos
      products_carrinho.each do |p|
        p = p.attributes
        p['product'] = Product.find(p['product_id'])
        p['carrinho'] = Carrinho.find(p['id'])
        @products_carrinho.push(p)
        @total += (p['product'].preco)*p['quantidade']
      end
    end
  end

  def atualiza_qtd
    qtd = carrinho_params['quantidade'].to_i
    product_id = carrinho_params['product_id'].to_i
    carrinho_id = carrinho_params['carrinho_id'].to_i
    carrinho = Carrinho.find(carrinho_id)

    if carrinho.quantidade == qtd
      redirect_back fallback_location: meu_carrinho_path
    else
      diferenca = qtd - carrinho.quantidade
      carrinho.quantidade = qtd
      carrinho.save
      altera_estoque(product_id, diferenca)
      redirect_back fallback_location: meu_carrinho_path
    end
  end

  def add_carrinho
  end

  def find_carrinho(user_id, product_id)
    return Carrinho.find_by(user_id: user_id, product_id: product_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrinho
      @carrinho = Carrinho.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def carrinho_params
      params.require(:carrinho).permit(:user, :product, :quantidade, :user_id, :product_id, :carrinho_id)
    end
end
