# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular "funcao", "funcoes"
  inflect.irregular "estabelecimento", "estabelecimentos"
  inflect.irregular "users_estabelecimento", "users_estabelecimentos"
  inflect.irregular "categoria", "categorias"
  inflect.irregular "produto", "produtos"
end
