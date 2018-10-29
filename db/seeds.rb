# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Movie.destroy_all

filename = Rails.root.join('db/movies.csv')

CSV.foreach(filename, col_sep: ';', headers: true) do |row|
  Movie.create row.to_h
end
