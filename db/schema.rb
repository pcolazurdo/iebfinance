# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150829134137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuenta", force: :cascade do |t|
    t.string   "cuenta"
    t.string   "subcuenta1"
    t.string   "subcuenta2"
    t.string   "subcuenta3"
    t.string   "subcuenta4"
    t.string   "subcuenta5"
    t.text     "descripcion"
    t.string   "nombre"
    t.string   "estado"
    t.string   "tipo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cuentas", force: :cascade do |t|
    t.string   "cuenta"
    t.string   "subcuenta1"
    t.string   "subcuenta2"
    t.string   "subcuenta3"
    t.string   "subcuenta4"
    t.string   "subcuenta5"
    t.text     "descripcion"
    t.string   "nombre"
    t.string   "estado"
    t.string   "tipo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "efectivos", force: :cascade do |t|
    t.date     "fecha"
    t.decimal  "Pesos2"
    t.decimal  "Pesos5"
    t.decimal  "Pesos10"
    t.decimal  "Pesos20"
    t.decimal  "Pesos50"
    t.decimal  "Pesos100"
    t.decimal  "PesosMonedas"
    t.decimal  "Dolares1"
    t.decimal  "Dolares2"
    t.decimal  "Dolares5"
    t.decimal  "Dolares10"
    t.decimal  "Dolares20"
    t.decimal  "Dolares50"
    t.decimal  "Dolares100"
    t.decimal  "DolaresMonedas"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "miembros", force: :cascade do |t|
    t.string   "idFiscal"
    t.string   "nombre"
    t.string   "estado"
    t.string   "tipo"
    t.string   "email"
    t.string   "direccion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "telefono"
    t.string   "localidad"
  end

  create_table "movimientos", force: :cascade do |t|
    t.date     "fecha"
    t.decimal  "IngresoPesos"
    t.decimal  "IngresoDolares"
    t.decimal  "EgresoPesos"
    t.decimal  "EgresoDolares"
    t.string   "Comprobante"
    t.text     "comentario"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "cuenta_id"
  end

  add_index "movimientos", ["cuenta_id"], name: "index_movimientos_on_cuenta_id", using: :btree

  create_table "ofrendas", force: :cascade do |t|
    t.date     "fecha"
    t.decimal  "montoPesos"
    t.decimal  "montoDolares"
    t.boolean  "esCheque"
    t.string   "idcheque"
    t.text     "comentario"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "cuenta_id"
    t.integer  "miembro_id"
  end

  add_index "ofrendas", ["cuenta_id"], name: "index_ofrendas_on_cuenta_id", using: :btree
  add_index "ofrendas", ["miembro_id"], name: "index_ofrendas_on_miembro_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vales", force: :cascade do |t|
    t.string   "cuenta"
    t.string   "responsable"
    t.date     "fechaEmision"
    t.date     "fechaRendicion"
    t.decimal  "montoPesos"
    t.decimal  "montoDolares"
    t.text     "comentario"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "cuenta_id"
  end

  add_index "vales", ["cuenta_id"], name: "index_vales_on_cuenta_id", using: :btree

end
