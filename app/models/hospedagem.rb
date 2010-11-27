class Hospedagem < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :quarto
  belongs_to :reserva

  has_many :produtos_hospedagens
  has_many :produtos, :through => :produtos_hospedagens

  validates_presence_of :cliente, :data_reserva, :data_fim, :quarto
  validates_numericality_of :diaria

  def cliente_nome
    self.cliente.nome if self.cliente
  end

  def adicionar_consumo(consumo)
    ProdutosHospedagem.create(:produto_id => consumo[:produto_id], :hospedagem_id => self.id, :valor => consumo[:valor], :quantidade => consumo[:quantidade])
  end

  def total_dias
    (data_fim - data_reserva).to_i
  end

  def calculo_total_diaria
    total_dias*diaria
  end

  def data_fim_formatada
    data_fim.try(:to_s, :br)
  end

  def data_fim_formatada=(string)
    self.data_fim = string.data_do_br if string.present?
  end

  def data_reserva_formatada
    data_reserva.try(:to_s, :br)
  end

  def data_reserva_formatada=(string)
    self.data_reserva = string.data_do_br if string.present?
  end

  def quarto_nome
    "#{quarto.andar} andar - classe: #{quarto.classe_nome}, tipo: #{quarto.tipo_nome}" if quarto
  end
end
