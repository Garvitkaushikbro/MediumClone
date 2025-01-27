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

ActiveRecord::Schema[7.0].define(version: 2023_08_04_162826) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id"
    t.string "topics"
    t.integer "likesCount"
    t.integer "viewCount"
    t.integer "commentCount"
    t.index ["author_id"], name: "index_articles_on_author_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.index ["email"], name: "index_authors_on_email", unique: true
    t.index ["password_digest"], name: "index_authors_on_password_digest"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commentContent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "author_id"
    t.integer "article_id"
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["author_id"], name: "index_comments_on_author_id"
  end

  add_foreign_key "articles", "authors"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "authors"
end
