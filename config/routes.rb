Rails.application.routes.draw do
  get 'predictor/fetch'

  get 'predictor/display'
  post 'predictor/display'

  resources :temperature_predictions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
