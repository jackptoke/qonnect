class CreateInterpreterLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :interpreter_languages do |t|
      t.references :interpreter, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
