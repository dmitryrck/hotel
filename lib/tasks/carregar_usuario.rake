namespace :criar do
  desc 'Criar usuário admin para o programa.'
  task :admin => :environment do
    Usuario.create(:login => 'admin', :senha => 'admin')
  end
end
