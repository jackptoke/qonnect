class Location < ApplicationRecord
  belongs_to :client, optional: false
  enum state: { NT: 0, NSW: 1, ACT: 2, VIC: 3, QLD: 4, SA: 5, WA: 6, TAS: 7}
end
