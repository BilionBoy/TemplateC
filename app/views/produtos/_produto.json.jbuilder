json.extract! produto, :id, :nome, :descricao, :preco, :categoria_id, :quantidade_estoque, :created_at, :updated_at
json.url produto_url(produto, format: :json)
