class Quarto < ActiveRecord::Base
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
end
