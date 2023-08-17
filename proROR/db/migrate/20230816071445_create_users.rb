ActiveRecord::Schema[7.0].define(version: 2023_08_16_094744) do
  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end
end
