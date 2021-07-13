# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :begin_at, null: false
      t.datetime :end_at, null: false
      t.text :description, null: false
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :mentor, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
    add_index :appointments, :begin_at
  end
end
