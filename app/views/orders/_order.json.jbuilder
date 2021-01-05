json.extract! order, :id, :user, :product, :quantidade, :numero_pedido, :preco, :endereco, :created_at, :updated_at
json.url order_url(order, format: :json)
