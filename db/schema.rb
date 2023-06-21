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

ActiveRecord::Schema[7.0].define(version: 2023_06_20_075009) do
  create_table "actions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "actionName"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "category_id"
    t.integer "status_id", default: 1
    t.integer "section_id"
    t.index ["category_id"], name: "index_documents_on_category_id"
    t.index ["section_id"], name: "index_documents_on_section_id"
    t.index ["status_id"], name: "index_documents_on_status_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "document_id"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "destination_user_id"
    t.integer "status_id", default: 1
    t.integer "origin_user_id"
    t.index ["destination_user_id"], name: "index_routes_on_destination_user_id"
    t.index ["document_id"], name: "index_routes_on_document_id"
    t.index ["status_id"], name: "index_routes_on_status_id"
  end

  create_table "sections", force: :cascade do |t|
    t.integer "division_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["division_id"], name: "index_sections_on_division_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "statusName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.integer "sections_id"
  end

  add_foreign_key "documents", "statuses"
  add_foreign_key "routes", "users", column: "destination_user_id"
end
