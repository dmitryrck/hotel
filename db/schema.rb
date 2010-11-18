# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101118144834) do

  create_table "clientes", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.text     "acompanhate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hospedagens", :force => true do |t|
    t.integer  "cliente_id"
    t.date     "data_reserva"
    t.date     "data_fim"
    t.integer  "quarto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produtos", :force => true do |t|
    t.string   "nome"
    t.float    "preco"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quartos", :force => true do |t|
    t.integer  "numero"
    t.integer  "andar"
    t.integer  "tipo"
    t.integer  "camas"
    t.integer  "classe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "login"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
    t.string   "senha_criptografada"
  end

end
