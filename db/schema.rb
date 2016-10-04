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

ActiveRecord::Schema.define(version: 20161003183858) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "vanity_conversions", force: :cascade do |t|
    t.integer "vanity_experiment_id"
    t.integer "alternative"
    t.integer "conversions"
    t.index ["vanity_experiment_id", "alternative"], name: "by_experiment_id_and_alternative", using: :btree
  end

  create_table "vanity_experiments", force: :cascade do |t|
    t.string   "experiment_id"
    t.integer  "outcome"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "completed_at"
    t.index ["experiment_id"], name: "index_vanity_experiments_on_experiment_id", using: :btree
  end

  create_table "vanity_metric_values", force: :cascade do |t|
    t.integer "vanity_metric_id"
    t.integer "index"
    t.integer "value"
    t.string  "date"
    t.index ["vanity_metric_id", "date"], name: "index_vanity_metric_values_on_vanity_metric_id_and_date", using: :btree
  end

  create_table "vanity_metrics", force: :cascade do |t|
    t.string   "metric_id"
    t.datetime "updated_at"
    t.index ["metric_id"], name: "index_vanity_metrics_on_metric_id", using: :btree
  end

  create_table "vanity_participants", force: :cascade do |t|
    t.string   "experiment_id"
    t.string   "identity"
    t.integer  "shown"
    t.integer  "seen"
    t.integer  "converted"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["experiment_id", "converted"], name: "by_experiment_id_and_converted", using: :btree
    t.index ["experiment_id", "identity"], name: "by_experiment_id_and_identity", using: :btree
    t.index ["experiment_id", "seen"], name: "by_experiment_id_and_seen", using: :btree
    t.index ["experiment_id", "shown"], name: "by_experiment_id_and_shown", using: :btree
    t.index ["experiment_id"], name: "index_vanity_participants_on_experiment_id", using: :btree
  end

end
