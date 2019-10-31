class RemoveLanguageFromInterpreterLanguages < ActiveRecord::Migration[6.0]
  def change
    remove_reference :interpreter_languages, :language, null: false, foreign_key: true
  end
end
