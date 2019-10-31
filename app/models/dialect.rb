class Dialect < ApplicationRecord
  belongs_to :language
  belongs_to :dialects
  validates_presence_of :language
  validates :dialect_name, presence: true
end
