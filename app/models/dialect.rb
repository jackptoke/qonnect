class Dialect < ApplicationRecord
  belongs_to :language
  has_many :job_bookings
  validates_presence_of :language
end
