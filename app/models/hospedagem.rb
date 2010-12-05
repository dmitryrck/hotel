class Hospedagem < ActiveRecord::Base
  belongs_to :cliente
  belongs_to :quarto
  belongs_to :reserva

  has_many :produtos_hospedagens
  has_many :produtos, :through => :produtos_hospedagens

  validates_presence_of :cliente, :data_reserva, :data_fim, :quarto
  validates_numericality_of :diaria

  before_validation_on_create :setar_diaria

  def validate
    if data_reserva.present? and data_fim.present?
      if data_reserva > data_fim
        errors.add(:data_reserva, 'Tem que ser menor que a Data de Saída')
        errors.add(:data_fim, 'Tem que ser maior que a Data de Entrada')
      end
    end
  end

  def cliente_nome
    self.cliente.nome if self.cliente
  end

  def adicionar_consumo(consumo)
    valor_total = consumo[:valor].to_i * consumo[:quantitdade].to_i
    if consumo[:valor].present?
      valor_produto = consumo[:valor].to_i
    else
      valor_produto = Produto.find(consumo[:produto_id]).preco
    end
    ProdutosHospedagem.create(
      :produto_id => consumo[:produto_id],
      :hospedagem_id => self.id,
      :valor => valor_produto,
      :quantidade => consumo[:quantidade],
      :valor_total => valor_total
    )
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

  def valor_consumo
    self.produtos_hospedagens.sum(:valor_total)
  end

  def contabilizar
    self.total = calculo_total_diaria + valor_consumo
  end

  def contabilizar!
    self.contabilizar
    self.save
  end

  def finalizar
    self.finalizado = true
  end

  def finalizar!
    self.finalizar
    self.save
  end

  def contabilizar_e_finalizar!
    self.contabilizar
    self.finalizar
    self.save
  end

  def estado
    self.finalizado? ? "finalizado" : "ativo"
  end

  def self.quartos_em(data)
    Quarto.count - self.count(:conditions => ['data_reserva <= ? and data_fim >= ?', data, data])
  end

  def after_initialize
    if reserva_id.present?
      self.data_reserva = reserva.data
    end
  end

  private
  def setar_diaria
    self.diaria = self.quarto.diaria if diaria.blank? and quarto_id.present?
  end
end
