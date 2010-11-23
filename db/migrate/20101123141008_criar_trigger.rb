class CriarTrigger < ActiveRecord::Migration
  def self.up
    execute 'create language plpgsql;'
    execute <<-END
CREATE FUNCTION totaliza() RETURNS trigger AS
$BODY$

begin
  new.valor_total = new.valor * new.quantidade;
  return new;
end
$BODY$
  LANGUAGE "plpgsql"
    END
    execute 'create trigger tr_totaliza before insert or update on produtos_hospedagens for each row execute procedure totaliza();'
  end

  def self.down
    execute 'drop trigger tr_totaliza on produtos_hospedagens;'
    execute 'drop function totaliza();'
    execute 'drop language plpgsql;'
  end
end
