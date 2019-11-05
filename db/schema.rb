# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_04_224520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street_address"
    t.string "suburb"
    t.integer "state"
    t.string "postcode"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "interpreter_id", null: false
    t.index ["interpreter_id"], name: "index_addresses_on_interpreter_id"
  end

  create_table "available_interpreters", force: :cascade do |t|
    t.bigint "interpreter_id", null: false
    t.bigint "job_booking_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interpreter_id"], name: "index_available_interpreters_on_interpreter_id"
    t.index ["job_booking_id"], name: "index_available_interpreters_on_job_booking_id"
  end

  create_table "booked_interpreters", force: :cascade do |t|
    t.bigint "job_booking_id", null: false
    t.bigint "interpreter_id", null: false
    t.datetime "time_interpreter_arrived"
    t.datetime "time_interpreter_started"
    t.datetime "time_interpreter_finished"
    t.text "interpreter_remark"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["interpreter_id"], name: "index_booked_interpreters_on_interpreter_id"
    t.index ["job_booking_id"], name: "index_booked_interpreters_on_job_booking_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "contact_name"
    t.string "organisation_name"
    t.string "acn"
    t.string "mobile_no"
    t.string "telephone_no"
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "dialects", force: :cascade do |t|
    t.string "dialect_name"
    t.bigint "language_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["language_id"], name: "index_dialects_on_language_id"
  end

  create_table "interpreter_languages", force: :cascade do |t|
    t.bigint "interpreter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dialect_id", null: false
    t.index ["dialect_id"], name: "index_interpreter_languages_on_dialect_id"
    t.index ["interpreter_id"], name: "index_interpreter_languages_on_interpreter_id"
  end

  create_table "interpreters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "abn"
    t.string "mobile"
    t.integer "sex"
    t.decimal "payment_rate", default: "75.0"
    t.decimal "rating_score", default: "5.0"
    t.index ["email"], name: "index_interpreters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_interpreters_on_reset_password_token", unique: true
  end

  create_table "job_bookings", force: :cascade do |t|
    t.datetime "appointment_time"
    t.integer "booking_length"
    t.string "booking_title"
    t.text "booking_description"
    t.text "further_instruction"
    t.string "contact_person"
    t.string "contact_no"
    t.integer "number_of_interpreter"
    t.integer "job_status"
    t.decimal "cost"
    t.integer "payment_status"
    t.string "payment_reference"
    t.bigint "client_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "dialect_id", null: false
    t.index ["client_id"], name: "index_job_bookings_on_client_id"
    t.index ["dialect_id"], name: "index_job_bookings_on_dialect_id"
    t.index ["location_id"], name: "index_job_bookings_on_location_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "language_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.string "building_info"
    t.string "street_address"
    t.string "suburb"
    t.integer "state"
    t.string "postcode"
    t.boolean "is_billing_address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_locations_on_client_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "interpreters"
  add_foreign_key "available_interpreters", "interpreters"
  add_foreign_key "available_interpreters", "job_bookings"
  add_foreign_key "booked_interpreters", "interpreters"
  add_foreign_key "booked_interpreters", "job_bookings"
  add_foreign_key "dialects", "languages"
  add_foreign_key "interpreter_languages", "dialects"
  add_foreign_key "interpreter_languages", "interpreters"
  add_foreign_key "job_bookings", "addresses", column: "location_id"
  add_foreign_key "job_bookings", "clients"
  add_foreign_key "job_bookings", "dialects"
  add_foreign_key "locations", "clients"
end
