class Measurements < ActiveRecord::Migration[5.0]
    def change
      drop_table :measurements
      create_table :measurements do |t|
      t.string :measurement_type

      t.timestamps
    end
  end
end
