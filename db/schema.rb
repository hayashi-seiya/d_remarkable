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

ActiveRecord::Schema.define(version: 20180526103244) do

  create_table "attractions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.bigint "park_id"
    t.string "name", null: false
    t.integer "duration_time", comment: "所要時間"
    t.integer "waiting_time", comment: "待ち時間"
    t.boolean "fastpass_flag", comment: "ファストパスが発券できるか"
    t.time "business_hours_open"
    t.time "business_hours_close"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_attractions_on_name", unique: true
    t.index ["park_id"], name: "index_attractions_on_park_id"
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "type", null: false, comment: "どの写真か(attraction, show, restaurant)"
    t.integer "type_id", null: false, comment: "type.id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parks", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.string "name", null: false
    t.time "business_hours_open", null: false
    t.time "business_hours_close", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.bigint "park_id"
    t.string "name", null: false
    t.time "business_hours_open"
    t.time "business_hours_close"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_restaurants_on_park_id"
  end

  create_table "shows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin" do |t|
    t.bigint "park_id"
    t.string "name", null: false
    t.integer "duration_time", comment: "所要時間"
    t.integer "waiting_time", comment: "待ち時間"
    t.time "business_hours_open"
    t.time "business_hours_close"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_shows_on_park_id"
  end

  add_foreign_key "attractions", "parks"
  add_foreign_key "restaurants", "parks"
  add_foreign_key "shows", "parks"
end
