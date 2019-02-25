# RailsFlix :: Trestle Demo Application

Rails Flix is a simple application created to demonstrate the [Trestle admin framework](https://github.com/TrestleAdmin/trestle).

> Admin: https://demo.trestle.io/admin (`demo@example.com` / `demo`)<br />
> Frontend: https://demo.trestle.io

Along with the core [trestle]((https://github.com/TrestleAdmin/trestle)) gem, this demo also uses [trestle-auth](https://github.com/TrestleAdmin/trestle-auth) (for admin authentication) and [trestle-search](https://github.com/TrestleAdmin/trestle-search) (for search in combination with [pg_search](https://github.com/Casecommons/pg_search)).


## Code of Interest

1. Trestle admin definitions located in [app/admin](app/admin)
2. Custom view partials used by admins at [app/views/admin/shared](app/views/admin/shared)
3. Custom JS/CSS for admin in [app/assets/javascript/trestle](app/assets/javascript/trestle) and [app/assets/stylesheets/trestle](app/assets/stylesheets/trestle)
4. Data models in [app/models](app/models) (all fairly standard ActiveRecord)


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


## License

This application is available as open source under the terms of the [LGPLv3 License](https://opensource.org/licenses/LGPL-3.0).
