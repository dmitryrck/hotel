class Quarto < ActiveRecord::Base
  has_many :hospedagens

  validates_presence_of :numero, :andar, :tipo, :camas, :classe
  validates_numericality_of :numero, :andar, :camas, :diaria

  def tipo_nome
    if self.tipo == 1
      "Solteiro"
    elsif self.tipo == 2
      "casal"
    end
  end

  def classe_nome
    if self.classe == 1
      "Apartamento"
    elsif self.classe == 2
      "Suite"
    elsif self.classe == 3
      "Master"
    end
  end

  def nome
    "#{andar} andar - classe: #{classe_nome}, tipo: #{tipo_nome} - R$ #{diaria}"
  end
end
