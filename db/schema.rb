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

ActiveRecord::Schema.define(version: 20180413081921) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.text "information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "browsings", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_browsings_on_product_id"
    t.index ["user_id"], name: "index_browsings_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "discs", force: :cascade do |t|
    t.integer "product_id"
    t.string "disc_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_discs_on_product_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_favorites_on_product_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "cd_title"
    t.string "artist"
    t.text "picture_id"
    t.text "sound_source"
    t.integer "price"
    t.string "label"
    t.string "genre"
    t.integer "stock"
    t.date "start_date"
    t.boolean "product_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchasers", force: :cascade do |t|
    t.integer "user_id"
    t.string "p_code"
    t.string "d_region"
    t.string "d_street"
    t.string "d_name"
    t.string "pay"
    t.string "status"
    t.date "p_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_purchasers_on_user_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "purchaser_id"
    t.integer "product_id"
    t.integer "sale"
    t.integer "sale_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_receipts_on_product_id"
    t.index ["purchaser_id"], name: "index_receipts_on_purchaser_id"
  end

  create_table "tunes", force: :cascade do |t|
    t.integer "disc_id"
    t.integer "order"
    t.string "song_title"
    t.date "song_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disc_id"], name: "index_tunes_on_disc_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name_sei"
    t.string "name_mei"
    t.string "name_kana_sei"
    t.string "name_kana_mei"
    t.date "birthday"
    t.string "sex"
    t.string "postal_code"
    t.string "region"
    t.string "street"
    t.string "phone"
    t.string "credit_card"
    t.boolean "customer_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
