class CreateQuartos < ActiveRecord::Migration
  def self.up
    create_table :quartos do |t|
      t.integer :numero
      t.integer :andar
      t.integer :tipo
      t.integer :camas
      t.integer :classe

      t.timestamps
    end
  end

  def self.down
    drop_table :quartos
  end
end
