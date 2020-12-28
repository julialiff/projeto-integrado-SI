json.extract! endereco, :id, :logradouro, :cep, :bairro, :cidade, :estado, :complemento, :numero, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
