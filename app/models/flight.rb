class Flight < ApplicationRecord
  belongs_to :departure, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
end
