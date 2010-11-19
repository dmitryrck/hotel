class AdicionarReservaIdParaHospedagem < ActiveRecord::Migration
  def self.up
    add_column :hospedagens, :reserva_id, :integer
  end

  def self.down
    remove_column :hospedagens, :reserva_id
  end
end
