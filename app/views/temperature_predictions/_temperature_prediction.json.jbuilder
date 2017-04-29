json.extract! temperature_prediction, :id, :zip, :temp, :date_covered, :date_issued, :created_at, :updated_at
json.url temperature_prediction_url(temperature_prediction, format: :json)
