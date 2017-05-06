# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

hash = JSON.parse(File.read('./db/tfl-tube-data.json'), :symbolize_names => true)
hash[:stations].each do |key, station|
  Station.new(:code => key, :name => station).save
end
