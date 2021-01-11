class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @categories = Category.all
    @comerciantes = Comerciante.all
    @category_id = params['category_id']
    @comerciante_id = params['comerciante_id']
    @nome_produto = params['nome_produto']
    @order = params['order']
    @filter = params['filter']
    if @nome_produto && !@nome_produto.empty?
      puts '-'*25
      nome_produto = '%'+params['nome_produto']+'%'
      @products = @products.where("nome ILIKE ?", nome_produto)
    end
    if @category_id && !@category_id.empty?
      @products = @products.where(category_id: @category_id.to_i)
    end
    if @comerciante_id && !@comerciante_id.empty?
      @products = @products.where(comerciante_id: @comerciante_id.to_i)
    end
    if @filter && @order && !@filter.empty? && !@order.empty?
      filter = @filter + ' ' + @order
      @products = @products.order(filter)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @carrinho = Carrinho.new
  end

  # GET /products/new
  def new
    @categories = Category.where(is_active: true)
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @categories = Category.where(is_active: true)
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.foto.attach(params[:product][:foto])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Produto atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Produto excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:nome, :category_id, :descricao, :quantidade, :preco, :comerciante_id, :foto)
    end
end
