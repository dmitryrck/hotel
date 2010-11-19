class Hospedagem < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :reserva
  has_many :produtos_hospedagens
  has_many :produtos, :through => :produtos_hospedagens

  def cliente_nome
    self.cliente.nome if self.cliente
  end

  def adicionar_consumo(consumo)
    ProdutosHospedagem.create(:produto_id => consumo[:produto_id], :hospedagem_id => self.id, :valor => consumo[:valor], :quantidade => consumo[:quantidade], :valor_total => consumo[:quantidade].to_i * consumo[:valor].to_i)
  end

  def total_dias
    (data_fim - data_reserva).to_i
  end

  def calculo_total_diaria
    total_dias*diaria
  end
end
