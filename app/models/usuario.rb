class Usuario < ActiveRecord::Base
  def senha; end

  def senha=(senha)
    if senha.present? and senha.size >= 5
      self.salt = Digest::SHA1.hexdigest("#{Time.now.to_s}#{rand}")
      self.senha_criptografada = criptografar_senha(senha)
    end
  end

  def criptografar_senha(senha)
    Digest::SHA512.hexdigest( [senha, self.salt].join )
  end

  def autenticar(senha)
    if salt and senha_criptografada and senha.present?
      criptografar_senha(senha) == senha_criptografada ? true : false
    end
  end

  def self.autenticar(params)
    if params[:login].present? and params[:senha].present?
      usuario = self.find_by_login(params[:login])
      if usuario.autenticar(params[:senha])
        usuario.id
      else
        false
      end
    end
  end
end
