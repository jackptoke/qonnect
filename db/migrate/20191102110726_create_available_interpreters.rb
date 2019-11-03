class CreateAvailableInterpreters < ActiveRecord::Migration[6.0]
  def change
    create_table :available_interpreters do |t|
      t.references :interpreter, null: false, foreign_key: true
      t.references :job_booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
