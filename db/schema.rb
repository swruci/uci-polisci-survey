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

ActiveRecord::Schema.define(version: 2018_08_26_011540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "description"
    t.jsonb "data"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "survey_response_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["survey_response_id"], name: "index_answers_on_survey_response_id"
  end

  create_table "pages", force: :cascade do |t|
    t.bigint "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_pages_on_survey_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "q_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "settings"
    t.bigint "page_id"
    t.index ["page_id"], name: "index_questions_on_page_id"
  end

  create_table "survey_responses", force: :cascade do |t|
    t.bigint "survey_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["survey_id"], name: "index_survey_responses_on_survey_id"
  end

  create_table "surveys", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "afterword"
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "password_digest"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "survey_responses"
  add_foreign_key "pages", "surveys"
  add_foreign_key "questions", "pages"
  add_foreign_key "survey_responses", "surveys"
end
