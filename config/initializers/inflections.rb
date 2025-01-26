# config/initializers/inflections.rb

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular "funcao", "funcoes"
  inflect.irregular "estabelecimento", "estabelecimentos"
end
