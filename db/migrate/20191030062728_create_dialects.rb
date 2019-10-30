class CreateDialects < ActiveRecord::Migration[6.0]
  def change
    create_table :dialects do |t|
      t.string :dialect_name
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
