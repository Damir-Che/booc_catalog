
ActiveRecord::Schema.define(version: 2022_02_19_114541) do

  create_table "books", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "name"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
