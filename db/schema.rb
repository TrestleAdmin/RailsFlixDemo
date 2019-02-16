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

ActiveRecord::Schema.define(version: 2019_02_16_013706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genres_movies", id: false, force: :cascade do |t|
    t.bigint "genre_id"
    t.bigint "movie_id"
    t.index ["genre_id"], name: "index_genres_movies_on_genre_id"
    t.index ["movie_id"], name: "index_genres_movies_on_movie_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type", "name"], name: "index_genres_on_type_and_name"
  end

  create_table "movies", force: :cascade do |t|
    t.integer "tmdb_id"
    t.string "imdb_id"
    t.string "title"
    t.string "tagline"
    t.string "overview"
    t.string "homepage"
    t.string "status"
    t.integer "runtime"
    t.bigint "budget"
    t.bigint "revenue"
    t.date "release_date"
    t.string "poster_path"
    t.string "backdrop_path"
    t.boolean "video"
    t.float "vote_average"
    t.integer "vote_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_date"], name: "index_movies_on_release_date"
    t.index ["title"], name: "index_movies_on_title"
    t.index ["vote_average"], name: "index_movies_on_vote_average"
  end

end
