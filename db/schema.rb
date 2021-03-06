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

ActiveRecord::Schema.define(version: 20150816211809) do

  create_table "alternatives", force: :cascade do |t|
    t.string   "name"
    t.integer  "decision_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "score"
  end

  add_index "alternatives", ["decision_id"], name: "index_alternatives_on_decision_id"

  create_table "decisions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.string   "name"
    t.boolean  "constraint",  default: false
    t.integer  "rank"
    t.decimal  "weight"
    t.integer  "decision_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "goals", ["decision_id"], name: "index_goals_on_decision_id"

  create_table "scores", force: :cascade do |t|
    t.integer  "rating"
    t.decimal  "value"
    t.integer  "decision_id"
    t.integer  "goal_id"
    t.integer  "alternative_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "scores", ["alternative_id"], name: "index_scores_on_alternative_id"
  add_index "scores", ["decision_id"], name: "index_scores_on_decision_id"
  add_index "scores", ["goal_id"], name: "index_scores_on_goal_id"

end
