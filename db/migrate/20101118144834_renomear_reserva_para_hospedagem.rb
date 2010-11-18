class RenomearReservaParaHospedagem < ActiveRecord::Migration
  def self.up
    rename_table :reservas, :hospedagens
  end

  def self.down
    rename_table :hospedagens, :reservas
  end
end
