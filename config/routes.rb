Rails.application.routes.draw do
  get 'select2/tags', format: :json
  get 'select2/results', format: :json
end