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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170804062510) do
=======
ActiveRecord::Schema.define(version: 20170807014635) do
>>>>>>> a7b01894b8e3eb6bdb615094aef9628929176d39

  create_table "advices", force: :cascade do |t|
    t.integer "spot_id"
    t.string "picture"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lat"
    t.float "lng"
    t.index ["spot_id"], name: "index_advices_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "placeName"
    t.float "lat"
    t.float "lng"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "picture", null: false
    t.text "detailComment"
  end

end
