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

ActiveRecord::Schema.define(version: 2019_05_04_032238) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "order_lines", primary_key: ["order_id", "type_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "order_id", limit: 2, null: false, unsigned: true
    t.integer "type_id", null: false
    t.integer "ordered_quantity", limit: 1, default: 1, null: false, unsigned: true
    t.index ["type_id"], name: "order_line_fk2"
  end

  create_table "orders", primary_key: "order_id", id: :integer, limit: 2, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "customer_name", limit: 40, null: false
    t.string "customer_address", limit: 10, null: false
    t.string "street", limit: 40, null: false
    t.string "city", limit: 23, null: false
    t.string "province", limit: 19, null: false
    t.string "zip", limit: 4, null: false
    t.string "contact_number", limit: 15, null: false
    t.string "email", limit: 50, null: false
    t.timestamp "date_entered", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.decimal "shipping_fee", precision: 8, scale: 2, null: false
    t.string "payment_method", limit: 16, default: "Cash on Delivery", null: false
    t.decimal "total_amount", precision: 8, scale: 2, null: false
    t.string "order_status", limit: 9, default: "Pending", null: false
  end

  create_table "product_tags", primary_key: ["product_id", "tag_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "product_id", limit: 2, null: false, unsigned: true
    t.integer "tag_id", limit: 2, null: false, unsigned: true
    t.index ["tag_id"], name: "product_tag_fk1"
  end

  create_table "products", primary_key: "product_id", id: :integer, limit: 2, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "product_name", limit: 30, null: false
    t.string "product_category", limit: 9, null: false
    t.decimal "product_price", precision: 8, scale: 2, null: false
    t.integer "total_quantity", limit: 1, default: 0, null: false, unsigned: true
  end

  create_table "tags", primary_key: "tag_id", id: :integer, limit: 2, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "tag_name", limit: 20, null: false
  end

  create_table "types", primary_key: ["type_id", "product_id"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "type_id", null: false, auto_increment: true
    t.integer "product_id", limit: 2, null: false, unsigned: true
    t.string "type_color", limit: 20, null: false
    t.string "type_size", limit: 2, default: "S", null: false
    t.integer "type_quantity", limit: 1, default: 0, null: false, unsigned: true
    t.index ["product_id"], name: "type_fk"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "order_lines", "orders", primary_key: "order_id", name: "order_line_fk1"
  add_foreign_key "order_lines", "types", primary_key: "type_id", name: "order_line_fk2"
  add_foreign_key "product_tags", "products", primary_key: "product_id", name: "product_tag_fk2"
  add_foreign_key "product_tags", "tags", primary_key: "tag_id", name: "product_tag_fk1"
  add_foreign_key "types", "products", primary_key: "product_id", name: "type_fk", on_delete: :cascade
end
