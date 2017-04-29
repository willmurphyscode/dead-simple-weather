class CreateTemperaturePredictions < ActiveRecord::Migration[5.1]
  def change
    create_table :temperature_predictions do |t|
      t.string :zip
      t.string :temp
      t.date :date_covered
      t.date :date_issued

      t.timestamps
    end
  end
end
