class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  def checkout
    if !current_user || current_user.carrinhos.empty?
      redirect_to root_path
    end
    @endereco = current_user.enderecos.find_by(default: true)
    @products_carrinho = []
    @total = 0

    products_carrinho = current_user.carrinhos
    products_carrinho.each do |p|
      p = p.attributes
      p['product'] = Product.find(p['product_id'])
      p['carrinho'] = Carrinho.find(p['id'])
      @products_carrinho.push(p)
      @total += (p['product'].preco)*p['quantidade']
    end
  end

  def create_order
    if !current_user || current_user.carrinhos.empty?
      redirect_to root_path
    end
    @carrinhos = current_user.carrinhos
    order_number = DateTime.now.strftime('%Y%m%d').to_s + @carrinhos.first.id.to_s
    @carrinhos.each do |cart|
      preco_produto = Product.find(cart.product_id).preco
      order = Order.new(
        quantidade: cart.quantidade,
        numero_pedido: order_number,
        preco: preco_produto,
        user_id: current_user.id,
        product_id: cart.product_id,
        endereco_id: current_user.enderecos.find_by(default: true).id
      )
      order.save
      cart.destroy
    end
    redirect_to root_path, notice: "Pedido criado com sucesso"
  end

  def pedidos_cliente
    if current_user
      all_orders = current_user.orders
      @pedidos = []
      i = 0
      all_orders.each do |order|
        if @pedidos.empty?
          @pedidos[i] = [order]
          next
        end
        if @pedidos[i].last.numero_pedido == order.numero_pedido
          @pedidos[i].push(order)
        else
          i += 1
          @pedidos[i] = [order]
        end
      end
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user, :product, :quantidade, :numero_pedido, :preco, :endereco)
    end
end
