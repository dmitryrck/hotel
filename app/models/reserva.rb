class Reserva < ActiveRecord::Base
  has_one :hospedagem

  validates_presence_of :data, :cliente

  def ativo
    cancelado ? 'não' : 'sim'
  end

  def self.quartos_em(data)
    Quarto.count - Reserva.count(:conditions => ['data = ? and cancelado = ?', data, false])
  end
end
