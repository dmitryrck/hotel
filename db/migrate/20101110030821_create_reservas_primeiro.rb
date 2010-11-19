class CreateReservas < ActiveRecord::Migration
  def self.up
    create_table :reservas do |t|
      t.integer :cliente_id
      t.date :data_reserva
      t.date :data_fim
      t.integer :quarto_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reservas
  end
end
