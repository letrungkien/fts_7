# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140827090837) do

  create_table "answers", force: true do |t|
    t.integer  "question_id"
    t.string   "content"
    t.boolean  "right_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_answer_details", force: true do |t|
    t.integer  "exam_answer_id"
    t.integer  "answer_id"
    t.string   "answer_text"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_answers", force: true do |t|
    t.integer  "exam_id"
    t.integer  "question_id"
    t.boolean  "admin_check"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_question_details", force: true do |t|
    t.integer  "exam_question_id"
    t.integer  "quantity"
    t.string   "answer_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exam_questions", force: true do |t|
    t.integer  "subject_id"
    t.integer  "level_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exam_questions", ["name"], name: "index_exam_questions_on_name", using: :btree

  create_table "exams", force: true do |t|
    t.integer  "user_id"
    t.integer  "exam_question_id"
    t.boolean  "admin_check",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.integer  "subject_id"
    t.integer  "level_id"
    t.string   "content"
    t.string   "answer_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subjects", ["name"], name: "index_subjects_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
