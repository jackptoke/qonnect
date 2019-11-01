class Dialect < ApplicationRecord
  belongs_to :language
  belongs_to :dialects
  has_many :job_bookings
  validates_presence_of :language
  validates :dialect_name, presence: true
end
