class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :created_by
      t.text :description

      t.timestamps
    end
  end
end
