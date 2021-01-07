module OrdersHelper
  def get_product(product_id)
    Product.find(product_id)
  end

  def total(numero_pedido)
    total = 0
    Order.where(numero_pedido: numero_pedido).each do |o|
      total += (o.preco * o.quantidade)
    end
    total
  end
end
