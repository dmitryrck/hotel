class CriarChavePrimariaParaProdutosHospedagens < ActiveRecord::Migration
  def self.up
    #add_column :produtos_hospedagens, :id, :serial
  end

  def self.down
    #remove_column :produtos_hospedagens, :id
  end
end
