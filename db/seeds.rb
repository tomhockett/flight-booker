# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'CSV'

ActiveRecord::Base.transaction do
  Airport.destroy_all
  Flight.destroy_all

  airport_file_path = File.join Rails.root, 'us-airports.csv'
  CSV.foreach(airport_file_path,
              headers: :first_row,
              header_converters: :symbol) do |row|
    Airport.create(name: row[:name], airport_code: row[:iata_code]) if row[:iata_code].present?
  end

  santa_ana = Airport.find_by airport_code: 'SNA'
  la_guardia = Airport.find_by airport_code: 'LGA'
  (1..12).each do |hour|
    Flight.create(departure_id: santa_ana.id, destination_id: la_guardia.id, takeoff: Time.zone.now + hour.hour, duration: 24000)
  end
end
