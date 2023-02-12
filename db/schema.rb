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

ActiveRecord::Schema.define(version: 2023_02_11_121824) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "onsen_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["onsen_id"], name: "index_favorites_on_onsen_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "kounous", force: :cascade do |t|
    t.integer "onsen_kounou_id", null: false
    t.string "kounou_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["onsen_kounou_id"], name: "index_kounous_on_onsen_kounou_id"
  end

  create_table "onsen_kounous", force: :cascade do |t|
    t.integer "onsen_id", null: false
    t.integer "kounou_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kounou_id"], name: "index_onsen_kounous_on_kounou_id"
    t.index ["onsen_id"], name: "index_onsen_kounous_on_onsen_id"
  end

  create_table "onsen_senshitus", force: :cascade do |t|
    t.integer "onsen_id", null: false
    t.integer "senshitu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["onsen_id"], name: "index_onsen_senshitus_on_onsen_id"
    t.index ["senshitu_id"], name: "index_onsen_senshitus_on_senshitu_id"
  end

  create_table "onsens", force: :cascade do |t|
    t.integer "favorite_id", null: false
    t.integer "visit_id", null: false
    t.integer "review_id", null: false
    t.integer "onsen_senshitu_id", null: false
    t.integer "onsen_kounou_id", null: false
    t.string "name"
    t.text "introduction"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favorite_id"], name: "index_onsens_on_favorite_id"
    t.index ["onsen_kounou_id"], name: "index_onsens_on_onsen_kounou_id"
    t.index ["onsen_senshitu_id"], name: "index_onsens_on_onsen_senshitu_id"
    t.index ["review_id"], name: "index_onsens_on_review_id"
    t.index ["visit_id"], name: "index_onsens_on_visit_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "onsen_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["onsen_id"], name: "index_reviews_on_onsen_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "senshitus", force: :cascade do |t|
    t.integer "onsen_senshitu_id", null: false
    t.string "senshitu_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["onsen_senshitu_id"], name: "index_senshitus_on_onsen_senshitu_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "favorite_id", null: false
    t.integer "visit_id", null: false
    t.integer "review_id", null: false
    t.string "name", null: false
    t.text "introduction"
    t.boolean "is_deleted", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["favorite_id"], name: "index_users_on_favorite_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["review_id"], name: "index_users_on_review_id"
    t.index ["visit_id"], name: "index_users_on_visit_id"
  end

  create_table "visits", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "onsen_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["onsen_id"], name: "index_visits_on_onsen_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favorites", "onsens"
  add_foreign_key "favorites", "users"
  add_foreign_key "kounous", "onsen_kounous"
  add_foreign_key "onsen_kounous", "kounous"
  add_foreign_key "onsen_kounous", "onsens"
  add_foreign_key "onsen_senshitus", "onsens"
  add_foreign_key "onsen_senshitus", "senshitus"
  add_foreign_key "onsens", "favorites"
  add_foreign_key "onsens", "onsen_kounous"
  add_foreign_key "onsens", "onsen_senshitus"
  add_foreign_key "onsens", "reviews"
  add_foreign_key "onsens", "visits"
  add_foreign_key "reviews", "onsens"
  add_foreign_key "reviews", "users"
  add_foreign_key "senshitus", "onsen_senshitus"
  add_foreign_key "users", "favorites"
  add_foreign_key "users", "reviews"
  add_foreign_key "users", "visits"
  add_foreign_key "visits", "onsens"
  add_foreign_key "visits", "users"
end
