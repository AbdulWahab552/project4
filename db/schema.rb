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

ActiveRecord::Schema[7.0].define(version: 2023_10_10_070705) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "google_secret"
    t.string "mfa_secret"
    t.boolean "mfa_enabled"
    t.datetime "last_sign_in_at"
    t.boolean "online_status"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "BrandName"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "CategoryName"
  end

  create_table "product_masters", force: :cascade do |t|
    t.string "ProductName"
    t.text "Description"
    t.integer "Category_id", null: false
    t.integer "Brand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Brand_id"], name: "index_product_masters_on_Brand_id"
    t.index ["Category_id"], name: "index_product_masters_on_Category_id"
  end

  create_table "product_retailer_relations", force: :cascade do |t|
    t.decimal "price"
    t.integer "quantity"
    t.boolean "availability"
    t.integer "product_master_id", null: false
    t.integer "retailer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_master_id"], name: "index_product_retailer_relations_on_product_master_id"
    t.index ["retailer_id"], name: "index_product_retailer_relations_on_retailer_id"
  end

  create_table "retailers", force: :cascade do |t|
    t.string "RetailerName"
    t.string "Location"
    t.text "ContactInfo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "product_masters", "Brands"
  add_foreign_key "product_masters", "Categories"
  add_foreign_key "product_retailer_relations", "product_masters"
  add_foreign_key "product_retailer_relations", "retailers"
end
