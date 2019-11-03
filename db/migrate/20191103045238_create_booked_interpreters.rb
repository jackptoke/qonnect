class CreateBookedInterpreters < ActiveRecord::Migration[6.0]
  def change
    create_table :booked_interpreters do |t|
      t.references :job_booking, null: false, foreign_key: true
      t.references :interpreter, null: false, foreign_key: true
      t.datetime :time_interpreter_arrived
      t.datetime :time_interpreter_started
      t.datetime :time_interpreter_finished
      t.text :interpreter_remark

      t.timestamps
    end
  end
end
