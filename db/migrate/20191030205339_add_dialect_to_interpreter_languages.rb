class AddDialectToInterpreterLanguages < ActiveRecord::Migration[6.0]
  def change
    add_reference :interpreter_languages, :dialect, null: false, foreign_key: true
  end
end
