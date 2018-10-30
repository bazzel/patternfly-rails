# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Movie.destroy_all
Person.destroy_all
Genre.destroy_all

CSV.foreach(Rails.root.join('db/movies.csv'), col_sep: ';', headers: true) do |row|
  Movie.create row.to_h
end

CSV.foreach(Rails.root.join('db/people.csv'), col_sep: ';', headers: true) do |row|
  Person.create row.to_h
end

genre_min_age = [
  ['Comedy', 6],
  ['Action', 12],
  ['Drama', 16],
  ['Horror', 18]
]

Genre.create( genre_min_age.each_with_index.map do |e,i|
  %w(label minimum_age position).zip(e.push(i)).to_h
end)
