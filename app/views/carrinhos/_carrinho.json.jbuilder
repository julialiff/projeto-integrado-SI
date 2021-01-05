json.extract! carrinho, :id, :user, :product, :quantidade, :created_at, :updated_at
json.url carrinho_url(carrinho, format: :json)
