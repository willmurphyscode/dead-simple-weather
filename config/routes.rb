Rails.application.routes.draw do
  get '/', to: 'predictor#fetch'

  get 'predictor/fetch'

  get 'predictor/display'
  post 'predictor/display'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
