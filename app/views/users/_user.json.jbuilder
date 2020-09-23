json.extract! user, :id, :is_admin, :nome, :documento, :data_nascimento, :endereco, :created_at, :updated_at
json.url user_url(user, format: :json)
