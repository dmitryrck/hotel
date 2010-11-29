class AdicionarFinalizadoAHospedagem < ActiveRecord::Migration
  def self.up
    add_column :hospedagens, :finalizado, :boolean, :default => false
  end

  def self.down
    remove_column :hospedagens, :finalizado
  end
end
