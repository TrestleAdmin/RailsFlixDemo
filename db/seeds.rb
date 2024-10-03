# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Creating demo user (demo@example.com / demo)...\n"
Administrator.create(email: "demo@example.com", password: "demo", first_name: "Demo", last_name: "User")

# Pages of movies / TV shows to fetch
PAGES = ENV.fetch("PAGES") { 4 }.to_i

puts "Importing movies...\n"
TmdbImporter.new(scope: Tmdb::Movie, importer: MovieImporter, pages: PAGES).import do |movie|
  $stdout.write "\e[2K\r - #{movie.title}"
end
$stdout.write "\e[2K\r"

puts "Importing TV shows...\n"
TmdbImporter.new(scope: Tmdb::TV, importer: TVShowImporter, pages: PAGES).import do |tv_show|
  $stdout.write "\e[2K\r - #{tv_show.name}"
end
$stdout.write "\e[2K\r"

puts "Done!"
