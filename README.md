# RailsFlix :: Trestle Demo Application

## Local Development Setup

Requirements: Ruby 2.6.1, PostgreSQL, Yarn

1. Clone the repository

2. Run `bundle install` to install Ruby dependencies

3. Run `yarn install` to install JavaScript/CSS dependencies

4. (Optional) Seed the database from TheMovieDB.org

    a) Register for an account at https://www.themoviedb.org/account/signup

    b) Obtain your API key at https://www.themoviedb.org/settings/api. Either add this to a `.env` file in the project root as `TMDB_API_KEY`, or specify it on the command line as in the following commands.

    c) Create the database (default: `RailsFlix_development`), migrate and seed:

        $ TMDB_API_KEY={{YOUR_API_KEY}} bin/rails db:setup

    d) You can fetch more (or less) data from TheMovieDB.org using the PAGES environment variable (1 page = 20 results)

        $ TMDB_API_KEY={{YOUR_API_KEY}} PAGES=1 bin/rails db:setup

    > Note: If you choose not to seed the database, you will need to manually create an admin account. See `db/seeds.rb` or the [trestle-auth README](https://github.com/TrestleAdmin/trestle-auth).

5. Start the rails server

        $ bin/rails server

6. Login to the admin at http://localhost:3000/admin. The default account created in 4c) is:

    demo@example.com / demo
