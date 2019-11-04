class Language < ApplicationRecord
    has_many :dialects
    has_many :interpreter_language
end
