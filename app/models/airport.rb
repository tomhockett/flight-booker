class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight', foreign_key: :departure_id, dependent: :destroy
  has_many :arriving_flights, class_name: 'Flight', foreign_key: :destination_id, dependent: :destroy

  def trimmed_name_to_s
    name.gsub(' Airport', '')
  end
end
