# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_11_225116) do
  create_table "contas", force: :cascade do |t|
    t.decimal "saldo", precision: 10, scale: 2, default: "100.0"
    t.boolean "bloqueada", default: false
    t.string "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movimentos", force: :cascade do |t|
    t.integer "conta_id", null: false
    t.string "descricao"
    t.decimal "valor", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conta_id"], name: "index_movimentos_on_conta_id"
  end

  add_foreign_key "movimentos", "conta", column: "conta_id"
end
