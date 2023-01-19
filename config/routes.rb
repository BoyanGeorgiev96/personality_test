Rails.application.routes.draw do
  scope '/api/v1' do
    get 'personality_test', to: 'personality_tests#index'
    resource :personality_test, only: %i[update create]
    get '/login', to: 'sessions#create'
  end
end
