class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport', foreign_key: 'departure_id'
  belongs_to :to_airport, class_name: 'Airport', foreign_key: 'destination_id'

  def description
    "Flight ##{id} from #{from_airport.trimmed_name_to_s} to #{to_airport.trimmed_name_to_s}."
  end
end
