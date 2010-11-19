class AdicionarDiaria < ActiveRecord::Migration
  def self.up
    add_column :quartos, :diaria, :float
    add_column :hospedagens, :diaria, :float
    add_column :hospedagens, :total, :float
  end

  def self.down
    remove_column :quartos, :diaria
    remove_column :hospedagens, :diaria
    remove_column :hospedagens, :total
  end
end
