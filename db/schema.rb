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

ActiveRecord::Schema[7.0].define(version: 2022_12_31_034139) do
  create_table "laugh_logs", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "button_pressed_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_laugh_logs_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "video_id", default: 0, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
    t.index ["video_id"], name: "index_posts_on_video_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "videos", force: :cascade do |t|
    t.string "search_word"
    t.string "youtube_id"
    t.string "title"
    t.text "description"
    t.string "thumbnail"
    t.integer "view_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "laugh_logs", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "posts", "videos"
end
