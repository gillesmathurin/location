# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090415143507) do

  create_table "categories", :force => true do |t|
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "adresse"
    t.string   "zip"
    t.string   "ville"
    t.string   "telephone"
    t.string   "email"
    t.string   "fax"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "houses", :force => true do |t|
    t.string   "nom"
    t.string   "adresse"
    t.string   "zip"
    t.string   "ville"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.integer  "position"
  end

  create_table "houses_tarifs", :id => false, :force => true do |t|
    t.integer  "house_id"
    t.integer  "tarif_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.integer  "house_id"
    t.date     "date_debut"
    t.date     "date_fin"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "estimate",    :precision => 8, :scale => 2
  end

  create_table "offre_promos", :force => true do |t|
    t.string   "titre"
    t.text     "description"
    t.date     "date_debut"
    t.date     "date_fin"
    t.integer  "house_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promo_generales", :force => true do |t|
    t.string   "titre"
    t.text     "description"
    t.date     "date_debut"
    t.date     "date_fin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prospects", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.string   "email"
    t.string   "telephone"
    t.string   "fax"
    t.integer  "house_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_debut"
    t.date     "date_fin"
  end

  create_table "tarifs", :force => true do |t|
    t.integer  "days_nb"
    t.decimal  "price"
    t.string   "nom"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.string   "adresse",                   :limit => 40
    t.string   "code_postal"
    t.string   "ville"
    t.string   "telephone"
    t.string   "fax"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
