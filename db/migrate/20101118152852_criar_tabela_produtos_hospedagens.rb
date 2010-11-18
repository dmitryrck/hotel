class CriarTabelaProdutosHospedagens < ActiveRecord::Migration
  def self.up
    create_table :produtos_hospedagens, :id => false do |t|
      t.integer :produto_id
      t.integer :hospedagem_id
      t.float :valor
      t.float :quantidade
      t.float :valor_total
      t.timestamps
    end
  end

  def self.down
    drop_table :produtos_hospedagens
  end
end
