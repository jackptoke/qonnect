class Language < ApplicationRecord
    has_many :dialects
    has_many :interpreter_language

    accepts_nested_attributes_for :dialects, allow_destroy: true
    
end
