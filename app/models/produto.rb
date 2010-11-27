class Produto < ActiveRecord::Base
  has_many :produtos_hospedagens
  has_many :hospedagens, :through => :produtos_hospedagens

  validates_presence_of :nome, :preco
  validates_numericality_of :preco

  def nome_e_preco
    "#{nome} - R$ #{preco}"
  end
end
