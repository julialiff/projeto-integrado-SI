json.extract! product, :id, :nome, :category, :descricao, :quantidade, :preco, :comerciante, :foto, :created_at, :updated_at
json.url product_url(product, format: :json)
