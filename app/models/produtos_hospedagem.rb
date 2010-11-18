class ProdutosHospedagem < ActiveRecord::Base
  belongs_to :produto
  belongs_to :hospedagem
end
