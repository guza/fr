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

ActiveRecord::Schema.define(version: 0) do

  create_table "g_category", primary_key: "c_idx", force: :cascade do |t|
    t.string  "c_name",    limit: 45,                 null: false
    t.string  "c_subname", limit: 45
    t.string  "c_icon",    limit: 6
    t.boolean "c_type",    limit: 1,  default: false, null: false
  end

  create_table "g_follow", id: false, force: :cascade do |t|
    t.integer "f_mode", limit: 1,  default: 0, null: false
    t.string  "_m_idx", limit: 23,             null: false
    t.integer "_t_idx", limit: 8,              null: false
  end

  add_index "g_follow", ["_m_idx"], name: "fk_g_follow_g_member1_idx", using: :btree
  add_index "g_follow", ["_t_idx"], name: "fk_g_follow_g_target1_idx", using: :btree

  create_table "g_grumble", id: false, force: :cascade do |t|
    t.integer  "g_idx",         limit: 8,                     null: false
    t.text     "g_text",        limit: 65535,                 null: false
    t.boolean  "g_status",      limit: 1,     default: false, null: false
    t.text     "g_lan",         limit: 65535,                 null: false
    t.string   "g_image",       limit: 40
    t.integer  "g_like",        limit: 8,     default: 0,     null: false
    t.integer  "g_dislike",     limit: 8,     default: 0,     null: false
    t.boolean  "g_parcomplete", limit: 1,     default: false, null: false
    t.datetime "g_parendday",                                 null: false
    t.integer  "g_partotal",    limit: 2,     default: 0,     null: false
    t.integer  "g_parshow",     limit: 2,     default: 0,     null: false
    t.integer  "g_parhide",     limit: 2,     default: 0,     null: false
    t.boolean  "g_csolve",      limit: 1,     default: false
    t.datetime "g_writeday",                                  null: false
    t.integer  "g_secho",       limit: 8,     default: 0
    t.integer  "g_sreple",      limit: 8,     default: 0
    t.datetime "g_editday"
    t.string   "_m_idx",        limit: 23,                    null: false
  end

  add_index "g_grumble", ["_m_idx"], name: "fk_g_grumble_g_member1_idx", using: :btree
  add_index "g_grumble", ["g_parcomplete"], name: "fk_g_grumble_g_parcomplete", using: :btree
  add_index "g_grumble", ["g_status", "g_writeday", "_m_idx"], name: "fk_g_grumble", using: :btree

  create_table "g_grumble_echo", primary_key: "ge_idx", force: :cascade do |t|
    t.string   "ge_ip",     limit: 16, default: "000.000.000.000", null: false
    t.string   "ge_lan",    limit: 3,  default: "non",             null: false
    t.integer  "ge_state",  limit: 1,  default: 0,                 null: false
    t.integer  "ge_view",   limit: 1,  default: 0,                 null: false
    t.integer  "ge_share",  limit: 1,  default: 0,                 null: false
    t.string   "ge_age",    limit: 2,  default: "00",              null: false
    t.integer  "ge_gender", limit: 1,  default: 3,                 null: false
    t.datetime "ge_day",                                           null: false
    t.integer  "_g_idx",    limit: 8,                              null: false
  end

  add_index "g_grumble_echo", ["_g_idx"], name: "fk_g_grumble_echo_g_grumble1_idx", using: :btree

  create_table "g_grumble_par", primary_key: "gp_idx", force: :cascade do |t|
    t.integer  "gp_complete", limit: 1,  default: 0, null: false
    t.integer  "gp_par",      limit: 1,              null: false
    t.datetime "gp_regday",                          null: false
    t.integer  "_g_idx",      limit: 8,              null: false
    t.string   "_m_idx",      limit: 23,             null: false
  end

  add_index "g_grumble_par", ["_g_idx"], name: "fk_g_grumble_par_g_grumble1_idx", using: :btree
  add_index "g_grumble_par", ["_m_idx"], name: "fk_g_grumble_par_g_member1_idx", using: :btree

  create_table "g_grumble_target", primary_key: "gt_idx", force: :cascade do |t|
    t.integer "_g_idx", limit: 8, null: false
    t.integer "_t_idx", limit: 8, null: false
  end

  add_index "g_grumble_target", ["_g_idx"], name: "fk_g_board_target_g_board1_idx", using: :btree
  add_index "g_grumble_target", ["_t_idx"], name: "fk_g_board_target_g_target1_idx", using: :btree

  create_table "g_like", id: false, force: :cascade do |t|
    t.integer  "l_idx",    limit: 8,              null: false
    t.integer  "l_type",   limit: 1,  default: 0, null: false
    t.datetime "l_regday",                        null: false
    t.integer  "_g_idx",   limit: 8
    t.integer  "_s_idx",   limit: 8
    t.integer  "_r_idx",   limit: 8
    t.string   "_m_idx",   limit: 23,             null: false
  end

  add_index "g_like", ["_g_idx"], name: "fk_g_like_g_grumble1_idx", using: :btree
  add_index "g_like", ["_m_idx"], name: "fk_g_like_g_member1_idx", using: :btree
  add_index "g_like", ["_r_idx"], name: "fk_g_like_g_reple1_idx", using: :btree
  add_index "g_like", ["_s_idx"], name: "fk_g_like_g_solve1_idx", using: :btree

  create_table "g_line", id: false, force: :cascade do |t|
    t.integer "l_level", limit: 1,  default: 0, null: false
    t.integer "_t_idx",  limit: 8,              null: false
    t.string  "_m_idx",  limit: 23,             null: false
  end

  add_index "g_line", ["_m_idx"], name: "fk_g_line_g_member1_idx", using: :btree
  add_index "g_line", ["_t_idx"], name: "fk_g_line_g_target1_idx", using: :btree

  create_table "g_log", primary_key: "l_idx", force: :cascade do |t|
    t.integer  "l_type",   limit: 4,  default: 0
    t.string   "_m_idx",   limit: 23,             null: false
    t.integer  "_g_idx",   limit: 8
    t.integer  "_t_idx",   limit: 8
    t.datetime "l_regday",                        null: false
  end

  create_table "g_member", primary_key: "m_idx", force: :cascade do |t|
    t.string   "m_email",          limit: 100,                          null: false
    t.string   "m_nick",           limit: 10,                           null: false
    t.text     "m_password",       limit: 65535
    t.string   "m_pw_key",         limit: 32
    t.integer  "m_type",           limit: 1,     default: 0,            null: false
    t.integer  "m_status",         limit: 1,     default: 0,            null: false
    t.string   "m_birth",          limit: 10,    default: "0000.00.00", null: false
    t.integer  "m_gender",         limit: 1,                            null: false
    t.text     "m_sns_key",        limit: 65535
    t.text     "m_phone_key",      limit: 65535
    t.string   "m_phone_key_type", limit: 15
    t.string   "m_image",          limit: 48
    t.datetime "m_regday",                                              null: false
    t.datetime "m_editday"
  end

  add_index "g_member", ["m_email"], name: "m_email_UNIQUE", unique: true, using: :btree

  create_table "g_member_badge", primary_key: "mb_idx", force: :cascade do |t|
    t.integer "mb_grumble", limit: 8,  default: 0
    t.integer "mb_jury",    limit: 8,  default: 0
    t.integer "mb_jwin",    limit: 8,  default: 0
    t.integer "mb_win",     limit: 8,  default: 0
    t.integer "mb_low",     limit: 8,  default: 0
    t.integer "mb_like",    limit: 8,  default: 0
    t.integer "mb_dislike", limit: 8,  default: 0
    t.string  "_m_idx",     limit: 23,             null: false
  end

  add_index "g_member_badge", ["_m_idx"], name: "_m_idx_UNIQUE", unique: true, using: :btree
  add_index "g_member_badge", ["_m_idx"], name: "g_member_badge_index", using: :btree

  create_table "g_member_lang", primary_key: "ml_idx", force: :cascade do |t|
    t.string "ml_lang", limit: 5,  null: false
    t.string "_m_idx",  limit: 23, null: false
  end

  add_index "g_member_lang", ["ml_lang", "_m_idx"], name: "ml_lang_UNIQUE", unique: true, using: :btree

  create_table "g_notification", primary_key: "f_idx", force: :cascade do |t|
    t.integer  "f_status",   limit: 1,   default: 0, null: false
    t.string   "f_message",  limit: 100,             null: false
    t.integer  "_g_idx",     limit: 8
    t.integer  "_r_idx",     limit: 8
    t.string   "from_idx",   limit: 23,              null: false
    t.string   "to_idx",     limit: 23,              null: false
    t.datetime "f_writeday",                         null: false
    t.datetime "f_editday",                          null: false
  end

  add_index "g_notification", ["f_status"], name: "index_status", using: :btree
  add_index "g_notification", ["from_idx", "f_status"], name: "index_from", using: :btree
  add_index "g_notification", ["to_idx", "f_status"], name: "index_to", using: :btree

  create_table "g_reple", id: false, force: :cascade do |t|
    t.integer  "r_idx",      limit: 8,                     null: false
    t.text     "r_text",     limit: 65535,                 null: false
    t.integer  "r_like",     limit: 8,     default: 0,     null: false
    t.integer  "r_status",   limit: 1,     default: 0,     null: false
    t.boolean  "r_issolve",  limit: 1,     default: false, null: false
    t.datetime "r_writeday",                               null: false
    t.datetime "r_editday"
    t.datetime "r_solveday"
    t.integer  "_g_idx",     limit: 8
    t.integer  "_s_idx",     limit: 8
    t.string   "_m_idx",     limit: 23,                    null: false
  end

  add_index "g_reple", ["_g_idx"], name: "fk_g_reple_g_grumble1_idx", using: :btree
  add_index "g_reple", ["_m_idx"], name: "fk_g_reple_g_member1_idx", using: :btree
  add_index "g_reple", ["_s_idx"], name: "fk_g_reple_g_solve1_idx", using: :btree

  create_table "g_report", id: false, force: :cascade do |t|
    t.integer  "r_idx",      limit: 8,                 null: false
    t.integer  "r_type",     limit: 1,     default: 0, null: false
    t.text     "r_text",     limit: 65535,             null: false
    t.datetime "r_writeday",                           null: false
    t.integer  "_g_idx",     limit: 8
    t.integer  "_s_idx",     limit: 8
    t.string   "_m_idx",     limit: 23,                null: false
  end

  add_index "g_report", ["_g_idx"], name: "fk_g_report_g_grumble1_idx", using: :btree
  add_index "g_report", ["_m_idx"], name: "fk_g_report_g_member1_idx", using: :btree
  add_index "g_report", ["_s_idx"], name: "fk_g_report_g_solve1_idx", using: :btree

  create_table "g_setting", id: false, force: :cascade do |t|
    t.integer  "s_idx",          limit: 8,                  null: false
    t.boolean  "s_notification", limit: 1,  default: false, null: false
    t.datetime "s_editday",                                 null: false
    t.string   "_m_idx",         limit: 23,                 null: false
  end

  add_index "g_setting", ["_m_idx"], name: "fk_g_setting_g_member1_idx", using: :btree

  create_table "g_solve", id: false, force: :cascade do |t|
    t.integer  "s_idx",      limit: 8,                 null: false
    t.text     "s_text",     limit: 65535,             null: false
    t.integer  "s_status",   limit: 1,     default: 0, null: false
    t.string   "s_image",    limit: 40
    t.integer  "s_like",     limit: 8,     default: 0, null: false
    t.integer  "s_dislike",  limit: 8,     default: 0, null: false
    t.datetime "s_writeday",                           null: false
    t.datetime "s_editday"
    t.string   "_m_idx",     limit: 23,                null: false
    t.integer  "_gt_idx",    limit: 8,                 null: false
  end

  add_index "g_solve", ["_gt_idx"], name: "fk_g_solve_g_board_target1_idx", using: :btree
  add_index "g_solve", ["_m_idx"], name: "fk_g_solve_g_member1_idx", using: :btree

  create_table "g_tag", id: false, force: :cascade do |t|
    t.integer "t_idx",   limit: 8, null: false
    t.integer "_s_idx",  limit: 8
    t.integer "_g_idx",  limit: 8
    t.integer "_ti_idx", limit: 8, null: false
  end

  add_index "g_tag", ["_g_idx"], name: "fk_g_tag_g_board1_idx", using: :btree
  add_index "g_tag", ["_s_idx"], name: "fk_g_tag_g_solve1_idx", using: :btree
  add_index "g_tag", ["_ti_idx"], name: "fk_g_tag_g_tag_info1", using: :btree

  create_table "g_tag_info", primary_key: "ti_idx", force: :cascade do |t|
    t.string "ti_label", limit: 45, null: false
  end

  create_table "g_target", primary_key: "t_idx", force: :cascade do |t|
    t.string   "t_name",        limit: 45,                null: false
    t.float    "t_lat",         limit: 53
    t.float    "t_lng",         limit: 53
    t.integer  "t_status",      limit: 1,     default: 0, null: false
    t.string   "t_email",       limit: 255,               null: false
    t.text     "t_description", limit: 65535
    t.text     "t_url",         limit: 65535
    t.text     "t_address",     limit: 65535
    t.text     "t_image",       limit: 65535
    t.datetime "t_regday",                                null: false
    t.datetime "t_editday"
  end

  create_table "g_target_category", id: false, force: :cascade do |t|
    t.integer "_c_idx", limit: 4, null: false
    t.integer "_t_idx", limit: 8, null: false
  end

  add_index "g_target_category", ["_c_idx"], name: "fk_g_target_category_g_category_idx", using: :btree
  add_index "g_target_category", ["_t_idx"], name: "fk_g_target_category_g_target1_idx", using: :btree

  create_table "v_all_category_list", id: false, force: :cascade do |t|
    t.integer "c_idx",     limit: 4,  default: 0,     null: false
    t.string  "c_name",    limit: 45,                 null: false
    t.string  "c_subname", limit: 45
    t.string  "c_icon",    limit: 6
    t.boolean "c_type",    limit: 1,  default: false, null: false
  end

  create_table "v_count_grumble_reple", id: false, force: :cascade do |t|
    t.integer "gcnt",   limit: 8, default: 0, null: false
    t.integer "_g_idx", limit: 8
  end

  create_table "v_count_solve_reple", id: false, force: :cascade do |t|
    t.integer "scnt",   limit: 8, default: 0, null: false
    t.integer "_s_idx", limit: 8
  end

  create_table "v_exhibition_company", id: false, force: :cascade do |t|
    t.integer "t_idx",         limit: 8,     default: 0, null: false
    t.string  "t_name",        limit: 45,                null: false
    t.text    "t_description", limit: 65535
    t.text    "t_address",     limit: 65535
    t.text    "t_image",       limit: 65535
  end

  create_table "v_exhibition_grumbling", id: false, force: :cascade do |t|
    t.integer "t_idx",      limit: 8,     default: 0, null: false
    t.string  "t_name",     limit: 45,                null: false
    t.text    "t_image",    limit: 65535
    t.text    "g_text",     limit: 65535,             null: false
    t.string  "g_writeday", limit: 73
  end

  create_table "v_exhibition_rank", id: false, force: :cascade do |t|
    t.integer "t_idx",  limit: 8, default: 0, null: false
    t.integer "gcount", limit: 8, default: 0, null: false
  end

  create_table "v_follow_list", id: false, force: :cascade do |t|
    t.integer "t_idx",     limit: 8,     default: 0, null: false
    t.string  "t_name",    limit: 45,                null: false
    t.text    "t_image",   limit: 65535
    t.text    "t_address", limit: 65535
    t.text    "t_des",     limit: 65535
    t.integer "c_idx",     limit: 4,     default: 0, null: false
    t.string  "c_name",    limit: 45,                null: false
  end

  create_table "v_grumble_best_list", id: false, force: :cascade do |t|
    t.integer "g_idx",         limit: 8,                              default: 0,     null: false
    t.text    "g_text",        limit: 65535
    t.boolean "g_status",      limit: 1,                              default: false, null: false
    t.boolean "g_parcomplete", limit: 1,                              default: false, null: false
    t.string  "g_image",       limit: 40
    t.integer "g_like",        limit: 8,                              default: 0,     null: false
    t.integer "g_dislike",     limit: 8,                              default: 0,     null: false
    t.boolean "g_csolve",      limit: 1,                              default: false
    t.decimal "echo",                        precision: 10, scale: 4
    t.string  "g_writeday",    limit: 73
    t.text    "t_idx",         limit: 65535
    t.text    "t_image",       limit: 65535
    t.text    "t_name",        limit: 65535
    t.text    "_c_idx",        limit: 65535
    t.string  "writer",        limit: 23,                                             null: false
    t.integer "techo",         limit: 8,                              default: 0
    t.integer "rcnt",          limit: 8,                              default: 0
    t.text    "tags",          limit: 65535
  end

  create_table "v_grumble_detail", id: false, force: :cascade do |t|
    t.text    "t_idx",         limit: 65535
    t.text    "t_image",       limit: 65535
    t.text    "t_name",        limit: 65535
    t.text    "_c_idx",        limit: 65535
    t.integer "g_idx",         limit: 8,     default: 0,     null: false
    t.text    "g_text",        limit: 65535,                 null: false
    t.string  "g_image",       limit: 40
    t.integer "g_like",        limit: 8,     default: 0,     null: false
    t.integer "g_dislike",     limit: 8,     default: 0,     null: false
    t.boolean "g_parcomplete", limit: 1,     default: false, null: false
    t.boolean "g_status",      limit: 1,     default: false, null: false
    t.string  "g_writeday",    limit: 73
    t.string  "_m_idx",        limit: 23,                    null: false
    t.integer "techo",         limit: 8,     default: 0
    t.integer "rcnt",          limit: 8,     default: 0
    t.boolean "g_csolve",      limit: 1,     default: false
    t.text    "tags",          limit: 65535
    t.string  "d_type",        limit: 1,     default: "",    null: false
    t.integer "islike",        limit: 4
  end

  create_table "v_grumble_first_detail", id: false, force: :cascade do |t|
    t.text    "t_idx",         limit: 65535
    t.text    "t_name",        limit: 65535
    t.text    "t_image",       limit: 65535
    t.text    "_c_idx",        limit: 65535
    t.integer "g_idx",         limit: 8,     default: 0,  null: false
    t.text    "g_text",        limit: 65535,              null: false
    t.string  "g_image",       limit: 40
    t.integer "g_like",        limit: 8,     default: 0,  null: false
    t.integer "g_dislike",     limit: 8,     default: 0,  null: false
    t.integer "g_parcomplete", limit: 4,     default: 0,  null: false
    t.integer "g_status",      limit: 4,     default: 0,  null: false
    t.string  "g_writeday",    limit: 73
    t.string  "_m_idx",        limit: 23,    default: "", null: false
    t.integer "techo",         limit: 8
    t.integer "rcnt",          limit: 8
    t.text    "tags",          limit: 65535
    t.integer "g_csolve",      limit: 4
    t.string  "d_type",        limit: 1,     default: "", null: false
    t.integer "islike",        limit: 4
  end

  create_table "v_grumble_is_par", id: false, force: :cascade do |t|
    t.integer  "g_idx",    limit: 8, default: 0, null: false
    t.datetime "lasttime",                       null: false
  end

  create_table "v_grumble_list", id: false, force: :cascade do |t|
    t.integer "g_idx",         limit: 8,        default: 0,     null: false
    t.text    "g_text",        limit: 16777215
    t.boolean "g_status",      limit: 1,        default: false, null: false
    t.boolean "g_parcomplete", limit: 1,        default: false, null: false
    t.string  "g_image",       limit: 40
    t.integer "g_like",        limit: 8,        default: 0,     null: false
    t.integer "g_dislike",     limit: 8,        default: 0,     null: false
    t.boolean "g_csolve",      limit: 1,        default: false
    t.string  "g_writeday",    limit: 73
    t.text    "t_idx",         limit: 65535
    t.text    "t_image",       limit: 65535
    t.text    "t_name",        limit: 65535
    t.text    "_c_idx",        limit: 65535
    t.string  "member",        limit: 23,                       null: false
    t.string  "writer",        limit: 23,                       null: false
    t.integer "techo",         limit: 8,        default: 0
    t.integer "rcnt",          limit: 8,        default: 0
    t.text    "tags",          limit: 65535
  end

  create_table "v_grumble_member_popular_list", id: false, force: :cascade do |t|
    t.integer "g_idx",      limit: 8,        default: 0,     null: false
    t.text    "g_text",     limit: 16777215
    t.boolean "g_status",   limit: 1,        default: false, null: false
    t.string  "g_image",    limit: 40
    t.integer "g_like",     limit: 8,        default: 0,     null: false
    t.integer "g_dislike",  limit: 8,        default: 0,     null: false
    t.boolean "g_csolve",   limit: 1,        default: false
    t.string  "g_writeday", limit: 73
    t.text    "t_idx",      limit: 65535
    t.text    "t_image",    limit: 65535
    t.text    "t_name",     limit: 65535
    t.text    "_c_idx",     limit: 65535
    t.string  "member",     limit: 23,                       null: false
    t.string  "writer",     limit: 23,                       null: false
    t.integer "techo",      limit: 8,        default: 0
    t.integer "rcnt",       limit: 8,        default: 0
    t.text    "tags",       limit: 65535
  end

  create_table "v_grumble_member_recent_list", id: false, force: :cascade do |t|
    t.integer "g_idx",      limit: 8,        default: 0,     null: false
    t.text    "g_text",     limit: 16777215
    t.boolean "g_status",   limit: 1,        default: false, null: false
    t.string  "g_image",    limit: 40
    t.integer "g_like",     limit: 8,        default: 0,     null: false
    t.integer "g_dislike",  limit: 8,        default: 0,     null: false
    t.boolean "g_csolve",   limit: 1,        default: false
    t.string  "g_writeday", limit: 73
    t.text    "t_idx",      limit: 65535
    t.text    "t_image",    limit: 65535
    t.text    "t_name",     limit: 65535
    t.text    "_c_idx",     limit: 65535
    t.string  "member",     limit: 23,                       null: false
    t.string  "writer",     limit: 23,                       null: false
    t.integer "techo",      limit: 8,        default: 0
    t.integer "rcnt",       limit: 8,        default: 0
    t.text    "tags",       limit: 65535
  end

  create_table "v_grumble_popular_reple_list", id: false, force: :cascade do |t|
    t.integer "r_idx",      limit: 8,     default: 0,     null: false
    t.text    "r_text",     limit: 65535,                 null: false
    t.string  "r_writeday", limit: 73
    t.string  "_m_idx",     limit: 23,                    null: false
    t.integer "r_like",     limit: 8,     default: 0,     null: false
    t.boolean "r_issolve",  limit: 1,     default: false, null: false
    t.integer "islike",     limit: 4
    t.string  "WGRUMBLE",   limit: 23,                    null: false
    t.boolean "SGRUMBLE",   limit: 1,     default: false
  end

  create_table "v_grumble_recent_reple_list", id: false, force: :cascade do |t|
    t.integer "r_idx",      limit: 8,     default: 0,     null: false
    t.text    "r_text",     limit: 65535,                 null: false
    t.string  "r_writeday", limit: 73
    t.string  "_m_idx",     limit: 23,                    null: false
    t.integer "r_like",     limit: 8,     default: 0,     null: false
    t.boolean "r_issolve",  limit: 1,     default: false, null: false
    t.integer "islike",     limit: 4
    t.string  "WGRUMBLE",   limit: 23,                    null: false
    t.boolean "SGRUMBLE",   limit: 1,     default: false
  end

  create_table "v_grumble_solve_list", id: false, force: :cascade do |t|
    t.integer "t_idx",         limit: 8,     default: 0,  null: false
    t.string  "t_name",        limit: 45,                 null: false
    t.text    "t_image",       limit: 65535
    t.integer "_c_idx",        limit: 4,                  null: false
    t.integer "g_idx",         limit: 8,     default: 0,  null: false
    t.text    "g_text",        limit: 65535,              null: false
    t.string  "g_image",       limit: 40
    t.integer "g_like",        limit: 8,     default: 0,  null: false
    t.integer "g_dislike",     limit: 8,     default: 0,  null: false
    t.integer "g_parcomplete", limit: 4,     default: 0,  null: false
    t.integer "g_status",      limit: 4,     default: 0,  null: false
    t.string  "g_writeday",    limit: 73
    t.string  "_m_idx",        limit: 23,                 null: false
    t.integer "techo",         limit: 4,     default: 0,  null: false
    t.integer "rcnt",          limit: 4,     default: 0,  null: false
    t.integer "g_csolve",      limit: 4,     default: 0,  null: false
    t.text    "tags",          limit: 65535
    t.string  "d_type",        limit: 1,     default: "", null: false
    t.integer "islike",        limit: 4
  end

  create_table "v_grumble_solve_reple_list", id: false, force: :cascade do |t|
    t.integer "t_idx",         limit: 8,     default: 0,  null: false
    t.string  "t_name",        limit: 45,                 null: false
    t.text    "t_image",       limit: 65535
    t.integer "_c_idx",        limit: 4,                  null: false
    t.integer "g_idx",         limit: 8,     default: 0,  null: false
    t.text    "g_text",        limit: 65535,              null: false
    t.string  "g_image",       limit: 0,     default: "", null: false
    t.integer "g_like",        limit: 8,     default: 0,  null: false
    t.integer "g_dislike",     limit: 4,     default: 0,  null: false
    t.integer "g_parcomplete", limit: 4,     default: 0,  null: false
    t.integer "g_status",      limit: 4,     default: 0,  null: false
    t.string  "g_writeday",    limit: 73
    t.string  "_m_idx",        limit: 23,                 null: false
    t.integer "techo",         limit: 4,     default: 0,  null: false
    t.integer "rcnt",          limit: 4,     default: 0,  null: false
    t.integer "g_csolve",      limit: 4,     default: 0,  null: false
    t.string  "tags",          limit: 0,     default: "", null: false
    t.string  "d_type",        limit: 1,     default: "", null: false
    t.integer "islike",        limit: 4
  end

  create_table "v_grumble_target", id: false, force: :cascade do |t|
    t.integer "_g_idx",  limit: 8,                 null: false
    t.integer "t_cnt",   limit: 8,     default: 0, null: false
    t.text    "t_idx",   limit: 65535
    t.text    "t_image", limit: 65535
    t.text    "t_name",  limit: 65535
    t.text    "_c_idx",  limit: 65535
  end

  create_table "v_info_category", id: false, force: :cascade do |t|
    t.integer "c_idx",     limit: 4,  default: 0,     null: false
    t.integer "_t_idx",    limit: 8,                  null: false
    t.string  "c_name",    limit: 45,                 null: false
    t.string  "c_subname", limit: 45
    t.string  "c_icon",    limit: 6
    t.boolean "c_type",    limit: 1,  default: false, null: false
  end

  create_table "v_jury_box_lost", id: false, force: :cascade do |t|
    t.integer "g_idx",      limit: 8,     default: 0, null: false
    t.text    "g_text",     limit: 65535,             null: false
    t.string  "g_image",    limit: 40
    t.string  "_m_idx",     limit: 23,                null: false
    t.string  "g_writeday", limit: 73
    t.text    "t_idx",      limit: 65535
    t.text    "t_image",    limit: 65535
    t.text    "t_name",     limit: 65535
    t.text    "_c_idx",     limit: 65535
    t.text    "tags",       limit: 65535
  end

  create_table "v_jury_box_win", id: false, force: :cascade do |t|
    t.integer "g_idx",      limit: 8,     default: 0, null: false
    t.text    "g_text",     limit: 65535,             null: false
    t.string  "g_image",    limit: 40
    t.string  "_m_idx",     limit: 23,                null: false
    t.string  "g_writeday", limit: 73
    t.text    "t_idx",      limit: 65535
    t.text    "t_image",    limit: 65535
    t.text    "t_name",     limit: 65535
    t.text    "_c_idx",     limit: 65535
    t.text    "tags",       limit: 65535
  end

  create_table "v_jury_grumble", id: false, force: :cascade do |t|
    t.integer "g_idx",      limit: 8,     default: 0, null: false
    t.text    "g_text",     limit: 65535,             null: false
    t.string  "g_image",    limit: 40
    t.string  "_m_idx",     limit: 23,                null: false
    t.string  "g_writeday", limit: 73
    t.text    "t_idx",      limit: 65535
    t.text    "t_image",    limit: 65535
    t.text    "t_name",     limit: 65535
    t.text    "_c_idx",     limit: 65535
    t.text    "tags",       limit: 65535
  end

  create_table "v_member_badge", id: false, force: :cascade do |t|
    t.integer "gcnt",  limit: 8, default: 0
    t.integer "jcnt",  limit: 8, default: 0
    t.integer "jwcnt", limit: 8, default: 0
    t.integer "wcnt",  limit: 8, default: 0
    t.integer "lcnt",  limit: 8, default: 0
    t.integer "scnt",  limit: 8, default: 0
    t.integer "hcnt",  limit: 8, default: 0
  end

  create_table "v_notification_list", id: false, force: :cascade do |t|
    t.integer  "f_idx",      limit: 8,   default: 0, null: false
    t.integer  "f_status",   limit: 1,   default: 0, null: false
    t.string   "f_message",  limit: 100,             null: false
    t.integer  "_g_idx",     limit: 8
    t.integer  "_r_idx",     limit: 8
    t.string   "from_idx",   limit: 23,              null: false
    t.string   "to_idx",     limit: 23,              null: false
    t.string   "f_writeday", limit: 73
    t.datetime "f_editday",                          null: false
  end

  create_table "v_rank_target", id: false, force: :cascade do |t|
    t.integer "cnt",    limit: 8, default: 0, null: false
    t.integer "_t_idx", limit: 8,             null: false
  end

  create_table "v_search", id: false, force: :cascade do |t|
    t.string  "s_type", limit: 1,        default: "", null: false
    t.integer "s_01",   limit: 8,        default: 0,  null: false
    t.text    "s_02",   limit: 16777215
    t.string  "s_03",   limit: 40
    t.string  "s_04",   limit: 45
    t.string  "s_05",   limit: 73
    t.string  "s_06",   limit: 23,       default: "", null: false
    t.string  "s_07",   limit: 20
    t.text    "s_08",   limit: 65535
    t.text    "s_09",   limit: 65535
    t.text    "s_10",   limit: 65535
    t.text    "s_11",   limit: 65535
  end

  create_table "v_search_grumble_tag", id: false, force: :cascade do |t|
    t.integer "g_idx",         limit: 8,        default: 0,     null: false
    t.text    "g_text",        limit: 16777215
    t.boolean "g_status",      limit: 1,        default: false, null: false
    t.string  "g_image",       limit: 40
    t.boolean "g_csolve",      limit: 1,        default: false
    t.boolean "g_parcomplete", limit: 1,        default: false, null: false
    t.string  "g_writeday",    limit: 73
    t.string  "_m_idx",        limit: 23,                       null: false
    t.integer "techo",         limit: 8,        default: 0
    t.text    "tags",          limit: 65535
    t.integer "tag_level",     limit: 8,        default: 0,     null: false
    t.text    "c_idx",         limit: 65535
    t.text    "t_idx",         limit: 65535
    t.text    "t_image",       limit: 65535
    t.text    "t_name",        limit: 65535
  end

  create_table "v_search_tag", id: false, force: :cascade do |t|
    t.integer "g_idx",         limit: 8,        default: 0,     null: false
    t.text    "g_text",        limit: 16777215
    t.boolean "g_status",      limit: 1,        default: false, null: false
    t.string  "g_image",       limit: 40
    t.boolean "g_parcomplete", limit: 1,        default: false, null: false
    t.boolean "g_csolve",      limit: 1,        default: false
    t.string  "g_writeday",    limit: 73
    t.string  "_m_idx",        limit: 23,                       null: false
    t.integer "techo",         limit: 8,        default: 0
    t.text    "tags",          limit: 65535
    t.integer "tag_level",     limit: 8,        default: 0,     null: false
  end

  create_table "v_search_target", id: false, force: :cascade do |t|
    t.integer "t_idx",     limit: 8,     default: 0,     null: false
    t.string  "t_name",    limit: 45,                    null: false
    t.text    "t_image",   limit: 65535
    t.text    "t_des",     limit: 65535
    t.integer "chmail",    limit: 8,     default: 0,     null: false
    t.integer "gcount",    limit: 4
    t.integer "c_idx",     limit: 4,     default: 0,     null: false
    t.integer "_t_idx",    limit: 8,                     null: false
    t.string  "c_name",    limit: 45,                    null: false
    t.string  "c_subname", limit: 45
    t.string  "c_icon",    limit: 6
    t.boolean "c_type",    limit: 1,     default: false, null: false
  end

  create_table "v_solve_list", id: false, force: :cascade do |t|
    t.integer "t_idx",         limit: 8,     default: 0,  null: false
    t.string  "t_name",        limit: 45,    default: "", null: false
    t.text    "t_image",       limit: 65535
    t.integer "_c_idx",        limit: 4,     default: 0,  null: false
    t.integer "g_idx",         limit: 8,     default: 0,  null: false
    t.text    "g_text",        limit: 65535,              null: false
    t.string  "g_image",       limit: 40
    t.integer "g_like",        limit: 8,     default: 0,  null: false
    t.integer "g_dislike",     limit: 8,     default: 0,  null: false
    t.integer "g_parcomplete", limit: 4,     default: 0,  null: false
    t.integer "g_status",      limit: 4,     default: 0,  null: false
    t.string  "g_writeday",    limit: 73
    t.string  "_m_idx",        limit: 23,    default: "", null: false
    t.integer "techo",         limit: 4,     default: 0,  null: false
    t.integer "rcnt",          limit: 4,     default: 0,  null: false
    t.integer "g_csolve",      limit: 4,     default: 0,  null: false
    t.text    "tags",          limit: 65535
    t.string  "d_type",        limit: 1,     default: "", null: false
    t.integer "islike",        limit: 4
  end

  create_table "v_stat_grumble", id: false, force: :cascade do |t|
    t.integer "tgrumble", limit: 8,                default: 0, null: false
    t.decimal "sgrumble",           precision: 23
    t.decimal "hgrumble",           precision: 23
  end

