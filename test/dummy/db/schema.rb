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

ActiveRecord::Schema.define(version: 20160105202543) do

  create_table "preload_writer_tests", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preloadable_item_examples", force: :cascade do |t|
    t.integer  "preload_writer_test_id"
    t.integer  "value"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "preloadable_item_examples", ["preload_writer_test_id"], name: "index_preloadable_item_examples_on_preload_writer_test_id"

end
