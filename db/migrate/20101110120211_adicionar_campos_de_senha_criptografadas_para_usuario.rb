class AdicionarCamposDeSenhaCriptografadasParaUsuario < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :salt, :string
    add_column :usuarios, :senha_criptografada, :string
  end

  def self.down
    remove_column :usuarios, :salt
    remove_column :usuarios, :senha_criptografada
  end
end
