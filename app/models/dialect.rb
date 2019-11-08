class Dialect < ApplicationRecord
  belongs_to :language
  has_many :job_bookings
  has_many :interpreter_languages
  validates_presence_of :language
end
