class InterpreterLanguage < ApplicationRecord
  belongs_to :interpreter
  belongs_to :dialect
  has_many :dialects
  validates_presence_of :interpreter
  validates_presence_of :dialect
end
