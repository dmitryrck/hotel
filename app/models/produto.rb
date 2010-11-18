class Produto < ActiveRecord::Base
  has_many :produtos_hospedagens
  has_many :hospedagens, :through => :produtos_hospedagens
end
