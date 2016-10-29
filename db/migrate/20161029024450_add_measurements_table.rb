class AddMeasurementsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :Measurements do |t|
      t.string :measurement_type

      t.timestamps
      end
  end
end
