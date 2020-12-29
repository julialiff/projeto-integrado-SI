# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_29_193421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comerciantes", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nome"
    t.string "documento"
    t.index ["email"], name: "index_comerciantes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_comerciantes_on_reset_password_token", unique: true
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "logradouro"
    t.string "cep"
    t.string "bairro"
    t.string "cidade"
    t.string "estado"
    t.string "complemento"
    t.string "numero"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.boolean "default"
    t.string "nome"
    t.index ["user_id"], name: "index_enderecos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "is_admin"
    t.string "nome"
    t.string "documento"
    t.date "data_nascimento"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "enderecos", "users"
end
