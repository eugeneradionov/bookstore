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

ActiveRecord::Schema.define(version: 20170818141300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "book_id"
    t.index ["author_id", "book_id"], name: "index_authors_books_on_author_id_and_book_id"
    t.index ["author_id"], name: "index_authors_books_on_author_id"
    t.index ["book_id"], name: "index_authors_books_on_book_id"
  end

  create_table "billing_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "country"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "publication_year"
    t.decimal "price"
    t.decimal "height"
    t.decimal "width"
    t.decimal "depth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cover_url"
  end

  create_table "books_categories", id: false, force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "book_id"
    t.index ["book_id"], name: "index_books_categories_on_book_id"
    t.index ["category_id"], name: "index_books_categories_on_category_id"
  end

  create_table "books_image_urls", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "image_url_id"
    t.index ["book_id"], name: "index_books_image_urls_on_book_id"
    t.index ["image_url_id"], name: "index_books_image_urls_on_image_url_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.decimal "discount"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string "code"
    t.decimal "discount"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "method"
    t.integer "days_from"
    t.integer "days_to"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "image_urls", force: :cascade do |t|
    t.text "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1
    t.bigint "order_id"
    t.bigint "cart_id"
    t.index ["book_id"], name: "index_order_items_on_book_id"
    t.index ["cart_id"], name: "index_order_items_on_cart_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "delivery_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "shipping_address_id"
    t.bigint "billing_address_id"
    t.bigint "user_id"
    t.bigint "payment_id"
    t.bigint "order_statuses_id"
    t.decimal "discount", default: "0.0"
    t.index ["billing_address_id"], name: "index_orders_on_billing_address_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["delivery_id"], name: "index_orders_on_delivery_id"
    t.index ["order_statuses_id"], name: "index_orders_on_order_statuses_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
    t.index ["shipping_address_id"], name: "index_orders_on_shipping_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "card_number"
    t.string "name_on_card"
    t.string "mm_yy"
    t.integer "cvv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.string "zip"
    t.string "country"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_infos", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shipping_address_id"
    t.bigint "billing_address_id"
    t.bigint "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_address_id"], name: "index_user_infos_on_billing_address_id"
    t.index ["payment_id"], name: "index_user_infos_on_payment_id"
    t.index ["shipping_address_id"], name: "index_user_infos_on_shipping_address_id"
    t.index ["user_id"], name: "index_user_infos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_items", "books"
  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "order_statuses", column: "order_statuses_id"
  add_foreign_key "orders", "payments"
  add_foreign_key "orders", "users"
  add_foreign_key "user_infos", "users"
end
