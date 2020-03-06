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

ActiveRecord::Schema.define(version: 2020_03_02_072735) do

  create_table "abouts", force: :cascade do |t|
    t.string "profile"
    t.text "info"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_abouts_on_resume_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "country"
    t.string "state"
    t.string "city"
    t.integer "pincode"
    t.integer "business_id"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_addresses_on_business_id"
    t.index ["resume_id"], name: "index_addresses_on_resume_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "title"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.integer "pincode"
    t.string "owner_name"
    t.string "owner_post"
    t.text "info"
    t.string "email"
    t.string "website"
    t.string "facebook"
    t.string "instagram"
    t.string "business_pan"
    t.integer "contact_no"
    t.string "add_info_title"
    t.string "add_info_info"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "contact_no"
    t.integer "resume_id"
    t.integer "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_contacts_on_business_id"
    t.index ["resume_id"], name: "index_contacts_on_resume_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "name"
    t.string "board"
    t.string "degree"
    t.string "cource"
    t.string "graduation_status"
    t.date "pass_year"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "result"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_educations_on_resume_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "exp_type"
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "country"
    t.date "start_date"
    t.date "end_date"
    t.text "info"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_experiences_on_resume_id"
  end

  create_table "fieldchoices", force: :cascade do |t|
    t.string "main_field"
    t.string "sub_field"
    t.string "exp_year"
    t.string "exp_month"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_fieldchoices_on_resume_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "interest_list"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_interests_on_resume_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.integer "user_id"
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "resumeusers", force: :cascade do |t|
    t.string "prefix"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "mobile"
    t.string "website"
    t.string "linkedin"
    t.date "birthdate"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_resumeusers_on_resume_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "skill_list"
    t.string "rating"
    t.integer "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_skills_on_resume_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "mobile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
