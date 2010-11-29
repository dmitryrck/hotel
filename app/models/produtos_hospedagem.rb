class ProdutosHospedagem < ActiveRecord::Base
  belongs_to :produto
  belongs_to :hospedagem

  validates_presence_of :produto, :hospedagem, :valor, :quantidade
end
