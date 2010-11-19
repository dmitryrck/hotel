class CreateReservas < ActiveRecord::Migration
  def self.up
    create_table :reservas do |t|
      t.date :data
      t.string :cliente
      t.boolean :cancelado, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :reservas
  end
end
